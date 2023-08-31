//##// Contest ID: abc264
//##// Problem ID: abc264_a ( https://atcoder.jp/contests/abc264/tasks/abc264_a )
//##// Title: A. "atcoder".substr()
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-01 04:16:35 +0000 UTC ( https://atcoder.jp/contests/abc264/submissions/34487141 ) 

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

let l, r = si2 ()
let atcoder = " atcoder"
let () = String.sub ~pos:l ~len:(r - l + 1) atcoder |> ps
