//##// Contest ID: abc208
//##// Problem ID: abc208_c ( https://atcoder.jp/contests/abc208/tasks/abc208_c )
//##// Title: C. Fair Candy Distribution
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-07-12 10:40:29 +0000 UTC ( https://atcoder.jp/contests/abc208/submissions/24182860 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id
let k = scanf "%d " id
let an = Array.init n ~f:(fun i -> scanf "%d " id, i, 0)

(* *)
let ans =
  (* *)
  let a = k / n in
  let s = k mod n in
  an
  |> Array.sorted_copy ~compare:(fun (a, _, _) (b, _, _) -> Int.compare a b)
  |> Array.mapi ~f:(fun i (a1, a2, _) -> if i < s then a1, a2, a + 1 else a1, a2, a)
  |> Array.sorted_copy ~compare:(fun (_, a, _) (_, b, _) -> Int.compare a b)
;;

let () = ans |> Array.iter ~f:(fun (_, _, x) -> printf "%d\n" x)
