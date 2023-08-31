//##// Contest ID: abc266
//##// Problem ID: abc266_a ( https://atcoder.jp/contests/abc266/tasks/abc266_a )
//##// Title: A. Middle  Letter
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 10:37:44 +0000 UTC ( https://atcoder.jp/contests/abc266/submissions/34510386 ) 

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
let pc s = printf "%c\n" s
let pf f = printf "%0.6f\n" f
(************)
let ss = ss ()

let () = String.nget ss (String.length ss / 2) |> pc