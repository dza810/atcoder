//##// Contest ID: typical90
//##// Problem ID: typical90_b ( https://atcoder.jp/contests/typical90/tasks/typical90_b )
//##// Title: 002. Encyclopedia of Parentheses（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 06:49:03 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34524666 ) 

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

(************)

let nn = si ()

(* 0 (; 1 ) *)
let rec check n i =
  if n = 0
  then 0
  else (
    let v = check (n - 1) (i / 2) in
    let x = if i % 2 = 0 then 1 else -1 in
    if v >= 0 then v + x else -1)
;;

let rec print n i =
  if n = 0
  then ""
  else (
    let v = print (n - 1) (i / 2) in
    let x = if i % 2 = 0 then "(" else ")" in
    v ^ x)
;;

let () =
  0 -- ((1 lsl nn) - 1)
  |> filter ~f:(fun x -> check nn x = 0)
  |> map ~f:(print nn)
  |> iter ~f:ps
;;
