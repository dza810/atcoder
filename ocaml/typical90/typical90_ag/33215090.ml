//##// Contest ID: typical90
//##// Problem ID: typical90_ag ( https://atcoder.jp/contests/typical90/tasks/typical90_ag )
//##// Title: 033. Not Too Bright（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-14 06:13:52 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33215090 ) 

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

let hh, ww = si2 ()
let () = pi @@ if hh = 1 || ww = 1 then hh * ww else (hh + 1) / 2 * ((ww + 1) / 2)
