//##// Contest ID: typical90
//##// Problem ID: typical90_ad ( https://atcoder.jp/contests/typical90/tasks/typical90_ad )
//##// Title: 030. K Factors（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-04 05:33:50 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34594711 ) 

open Core
open Printf

(* open Num *)
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d \n" x else printf "%d " x;
        acc - 1)
  in
  ()
;;

let cache tbl key ~f =
  match Stdlib.Hashtbl.find_opt tbl key with
  | Some x -> x
  | None ->
    let x = f () in
    Stdlib.Hashtbl.add tbl key x;
    x
;;

let i2f x = Int.to_float x

(************)
let nn = si ()
let kk = si ()
let arr = Array.create ~len:(nn + 1) 0

let () =
  2 -- nn
  |> iter ~f:(fun i ->
         if arr.(i) = 0
         then 1 -- (nn / i) |> iter ~f:(fun j -> arr.(i * j) <- arr.(i * j) + 1)
         else ())
;;

let () = arr |> Array.filter ~f:(fun i -> i >= kk) |> Array.length |> pi
