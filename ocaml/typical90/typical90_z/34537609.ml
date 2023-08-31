//##// Contest ID: typical90
//##// Problem ID: typical90_z ( https://atcoder.jp/contests/typical90/tasks/typical90_z )
//##// Title: 026. Independent Set on a Tree（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 12:06:44 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34537609 ) 

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
    fold l ~init:(length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d\n" x else printf "%d " x;
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
let ab = 1 -- (nn - 1) >|= si2
let gg = Hashtbl.create (module Int)

let () =
  ab (fun (a, b) ->
      Hashtbl.add_multi gg ~key:a ~data:b;
      Hashtbl.add_multi gg ~key:b ~data:a)
;;

let colors = Array.init (nn + 1) ~f:(fun _ -> 0)

let rec color c p =
  if colors.(p) = 0
  then (
    colors.(p) <- c;
    Hashtbl.find_multi gg p |> List.iter ~f:(color (-c)))
;;

let () =
  color 1 1;
  let n = colors |> Array.count ~f:(fun x -> x = 1) in
  let c = if n >= nn / 2 then 1 else -1 in
  colors |> Array.filter_mapi ~f:(fun i x -> if x = c then Some i else None) |> of_array |> Iter.take (nn/2) |> pl
