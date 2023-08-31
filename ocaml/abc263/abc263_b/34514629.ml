//##// Contest ID: abc263
//##// Problem ID: abc263_b ( https://atcoder.jp/contests/abc263/tasks/abc263_b )
//##// Title: B. Ancestor
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 14:23:48 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34514629 ) 

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
(************)

let nn = si ()

let pp = Array.init (nn + 1) ~f:(fun i -> if i = 0 || i = 1 then 1 else si () )

let rec gen c i =
  if i = 1 then c else gen (c + 1) pp.(i)

let () = pi @@ gen 0 nn