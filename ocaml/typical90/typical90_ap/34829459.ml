//##// Contest ID: typical90
//##// Problem ID: typical90_ap ( https://atcoder.jp/contests/typical90/tasks/typical90_ap )
//##// Title: 042. Multiple of 9（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-13 03:39:33 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34829459 ) 

open Core
open Printf
open Num
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
let kk = si ()
let mm x = x % 1_000_000_007

let tbl = Stdlib.Hashtbl.create 1000000
let rec dp x =
  cache tbl x ~f:(fun () ->
    if x < 0 then 0
    else if x = 0 then 1 else
     1 -- 9 >|= (fun i -> mm @@ dp (x - i) ) |> fold ~init:0 ~f:(fun acc x -> mm (acc + x))
  )

let () = pi @@ if kk % 9 = 0 then dp kk else 0