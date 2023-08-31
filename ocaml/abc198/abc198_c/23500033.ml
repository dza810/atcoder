//##// Contest ID: abc198
//##// Problem ID: abc198_c ( https://atcoder.jp/contests/abc198/tasks/abc198_c )
//##// Title: C. Compass Walking
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-15 15:43:31 +0000 UTC ( https://atcoder.jp/contests/abc198/submissions/23500033 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let r = scanf "%d " id |> Float.of_int
let x = scanf "%d " id |> Float.of_int
let y = scanf "%d" id |> Float.of_int

(* *)
let ans =
  (* *)
  let l = Float.(sqrt ((x ** 2.0) + (y ** 2.0))) in
  let x =
    if Float.(l = r)
    then 1
    else if Float.(l < r)
    then 2
    else l /. r |> Float.iround_exn ~dir:`Up
  in
  x |> Int.to_string
;;

let () = ans |> print_endline
