//##// Contest ID: abc205
//##// Problem ID: abc205_a ( https://atcoder.jp/contests/abc205/tasks/abc205_a )
//##// Title: A. kcal
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-13 12:27:16 +0000 UTC ( https://atcoder.jp/contests/abc205/submissions/23426208 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let a, b = scanf "%d %d " (fun a b -> a, b)

(* *)
let ans =
  (* *)
  let out = a * b in
  if out mod 100 = 0 then
    out / 100 |> Int.to_string
  else
  Float.of_int out /. 100.0 |> Float.to_string 
;;

let () = ans |> print_endline
