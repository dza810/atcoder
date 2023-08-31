//##// Contest ID: abc264
//##// Problem ID: abc264_b ( https://atcoder.jp/contests/abc264/tasks/abc264_b )
//##// Title: B. Nice Grid
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-01 04:34:50 +0000 UTC ( https://atcoder.jp/contests/abc264/submissions/34487326 ) 

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

let r, c = si2 ()

let calc r c =
  let r = Int.min r (16 - r) in
  let c = Int.min c (16 - c) in
  if r % 2 = 1
  then c % 2 = 1 || (r <= c && c <= 15 - r)
  else c % 2 = 1 && not (r <= c && c <= 15 - r)
;;

let () =
  ps @@ if calc r c then "black" else "white"
