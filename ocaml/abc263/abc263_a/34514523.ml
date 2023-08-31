//##// Contest ID: abc263
//##// Problem ID: abc263_a ( https://atcoder.jp/contests/abc263/tasks/abc263_a )
//##// Title: A. Full House
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 14:18:09 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34514523 ) 

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

let () = 
  let f = 1 -- 5 >|= si |> count |> fold ~init:true ~f:(fun acc (_, x) -> acc && (x = 3 || x = 2) ) in
  ps @@ if f then "Yes" else "No"