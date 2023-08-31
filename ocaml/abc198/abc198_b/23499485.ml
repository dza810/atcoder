//##// Contest ID: abc198
//##// Problem ID: abc198_b ( https://atcoder.jp/contests/abc198/tasks/abc198_b )
//##// Title: B. Palindrome with leading zeros
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-15 15:12:58 +0000 UTC ( https://atcoder.jp/contests/abc198/submissions/23499485 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d" id

let n =
  let rec aux n =
    if n > 0 && n mod 10 = 0 then aux (n / 10) else n |> Int.to_string
  in
  aux n
;;

(* *)
let ans =
  (* *)
  if String.(n = rev n) then "Yes" else "No"
;;

let () = ans |> print_endline
