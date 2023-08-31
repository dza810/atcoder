//##// Contest ID: abc205
//##// Problem ID: abc205_c ( https://atcoder.jp/contests/abc205/tasks/abc205_c )
//##// Title: C. POW
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-13 12:54:17 +0000 UTC ( https://atcoder.jp/contests/abc205/submissions/23438089 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let a = scanf "%d " id
let b = scanf "%d " id
let c = scanf "%d " id

(* *)
let ans =
  (* *)
  let out a b =
    let a = Int.abs a in
    let b = Int.abs b in
    match Int.compare a b with
    | 0 -> "="
    | -1 -> "<"
    | 1 -> ">"
    | _ -> invalid_arg ""
  in
  match a >= 0, b >= 0, c mod 2 = 0 with
  | true, true, _
  | _, _, true ->
    out a b
  | true, false, false -> ">"
  | false, true, false -> "<"
  | false, false, false -> out b a
;;

let () = ans |> print_endline
