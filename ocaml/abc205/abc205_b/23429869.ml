//##// Contest ID: abc205
//##// Problem ID: abc205_b ( https://atcoder.jp/contests/abc205/tasks/abc205_b )
//##// Title: B. Permutation Check
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-13 12:34:26 +0000 UTC ( https://atcoder.jp/contests/abc205/submissions/23429869 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id
let xs = List.init n ~f:(fun _ -> scanf "%d " id)
let c = Array.init n ~f:(fun _ -> 0)

(* *)
let ans =
  (* *)
  let rec aux = function
    | [] -> ()
    | x :: xs -> c.(x-1) <- c.(x-1) + 1; aux xs
  in
  aux xs;
  let flg = c |> Array.fold ~init:true ~f:(fun acc x -> x = 1 && acc) in
  if flg then "Yes" else "No"
;;

let () = ans |> print_endline
