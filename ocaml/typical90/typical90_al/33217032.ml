//##// Contest ID: typical90
//##// Problem ID: typical90_al ( https://atcoder.jp/contests/typical90/tasks/typical90_al )
//##// Title: 038. Large LCM（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-14 07:52:08 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33217032 ) 

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
let a = ss () |> num_of_string
let b = ss () |> num_of_string

let rec gcd a b =
  if b >/ a then gcd b a else if b =/ num_of_int 0 then a else gcd b (mod_num a b)
;;

let () =
  let g = gcd a b in
  let x = a // g */ b in
  ps
  @@ if x >/ power_num (num_of_int 10) (num_of_int 18) then "Large" else string_of_num x
;;
