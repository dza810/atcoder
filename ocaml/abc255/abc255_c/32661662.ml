//##// Contest ID: abc255
//##// Problem ID: abc255_c ( https://atcoder.jp/contests/abc255/tasks/abc255_c )
//##// Title: C. ±1 Operation 1 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-22 14:12:57 +0000 UTC ( https://atcoder.jp/contests/abc255/submissions/32661662 ) 

open Core
open Printf

(* open Num *)
(* open IterLabels *)

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

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let option_either l ~f =
  List.fold l ~init:None ~f:(fun acc x ->
      match acc with
      | None -> f x
      | Some x -> Some x)
;;

(************)
let xx = si ()
let aa = si ()
let yy = xx - aa
let dd = si ()
let nn = si ()
let yy, dd = if dd < 0 then -yy, -dd else yy, dd

let () =
  if dd = 0
  then pi @@ Int.abs @@ yy
  else (
    let p, q = yy / dd, yy mod dd in
    if 0 <= p && p < (nn - 1)
    then pi @@ Int.min q (dd - q)
    else if p < 0
    then pi @@ Int.abs yy
    else if p >= (nn - 1)
    then pi @@ Int.abs @@ (yy - (dd * (nn - 1))))
;;
