//##// Contest ID: abc266
//##// Problem ID: abc266_c ( https://atcoder.jp/contests/abc266/tasks/abc266_c )
//##// Title: C. Convex Quadrilateral
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 11:01:51 +0000 UTC ( https://atcoder.jp/contests/abc266/submissions/34510708 ) 

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
let i2f x = Int.to_float x
(************)

let a = si2 ()
let b = si2 ()
let c = si2 ()
let d = si2 ()
let cross_product (x, y) (p, q) = (x * q) - (y * p)
let sub (x, y) (p, q) = x - p, y - q

let flg =
  cross_product (sub b a) (sub d a) > 0
  && cross_product (sub c b) (sub a b) > 0
  && cross_product (sub d c) (sub b c) > 0
  && cross_product (sub a d) (sub c d) > 0
;;

let () = ps @@ if flg then "Yes" else "No"
