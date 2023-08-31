//##// Contest ID: abc198
//##// Problem ID: abc198_a ( https://atcoder.jp/contests/abc198/tasks/abc198_a )
//##// Title: A. Div
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-14 15:13:48 +0000 UTC ( https://atcoder.jp/contests/abc198/submissions/23480296 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id

(* *)
let ans =
  (* *)
  n - 1 |> Int.to_string
;;

let () = ans |> print_endline
