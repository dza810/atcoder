//##// Contest ID: abc208
//##// Problem ID: abc208_d ( https://atcoder.jp/contests/abc208/tasks/abc208_d )
//##// Title: D. Shortest Path Queries 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-08-03 22:06:02 +0000 UTC ( https://atcoder.jp/contests/abc208/submissions/24763350 ) 

open Core

(* open Printf *)
open Scanf
(* open Num *)

let id x = x

(* *)

let n = scanf "%d " id
let m = scanf "%d " id

let f =
  let f =
    Array.init (n + 1) ~f:(fun _ ->
        Array.init (n + 1) ~f:(fun j ->
            Array.init (n + 1) ~f:(fun i -> if i = j then 0 else 500_000_000)))
  in
  for i = 1 to m do
    scanf "%d %d %d " (fun a b c -> f.(0).(a).(b) <- c)
  done;
  f
;;

let calc s t k =
  let a = f.(k - 1).(s).(t) in
  let b = f.(k - 1).(s).(k) + f.(k - 1).(k).(t) in
  let out = min a b in
  f.(k).(s).(t) <- out;
  out
;;

let ans =
  let out = ref 0 in
  for k = 1 to n do
    for s = 1 to n do
      for t = 1 to n do
        let x = calc s t k in
        if x < 500_000_000 then out := !out + x
      done
    done
  done;
  !out |> Int.to_string
;;

(* *)
let () = ans |> print_endline
