//##// Contest ID: abc265
//##// Problem ID: abc265_a ( https://atcoder.jp/contests/abc265/tasks/abc265_a )
//##// Title: A. Apple
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 06:11:07 +0000 UTC ( https://atcoder.jp/contests/abc265/submissions/34506029 ) 

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
let xx, yy, nn = si3 ()

let v1 = nn * xx

let v2 = (nn / 3) * yy + (nn % 3) * xx

let () = pi @@ Int.min v1 v2