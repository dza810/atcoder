//##// Contest ID: abc266
//##// Problem ID: abc266_b ( https://atcoder.jp/contests/abc266/tasks/abc266_b )
//##// Title: B. Modulo Number
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 10:43:34 +0000 UTC ( https://atcoder.jp/contests/abc266/submissions/34510453 ) 

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
(************)
let nn = ss () |> num_of_string

let m = num_of_int 998244353 
let mm x = mod_num (mod_num x m +/ m) m

let () =
  ps @@ string_of_num @@ mm nn


