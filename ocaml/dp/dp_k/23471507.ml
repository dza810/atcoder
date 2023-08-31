//##// Contest ID: dp
//##// Problem ID: dp_k ( https://atcoder.jp/contests/dp/tasks/dp_k )
//##// Title: K. Stones
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-14 08:20:57 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23471507 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id
let k = scanf "%d " id
let xs = List.init n ~f:(fun _ -> scanf "%d " id)
let dp_tbl = Array.init (2 * k) ~f:(fun _ -> None)
let () = dp_tbl.(0) <- Some false

let rec dp i =
  if i < 0
  then true
  else (
    match dp_tbl.(i) with
    | Some v -> v
    | None ->
      let v = xs |> List.fold ~init:false ~f:(fun acc x -> acc || (not @@ dp (i - x))) in
      dp_tbl.(i) <- Some v;
      v)
;;

(* *)
let ans =
  (* *)
  if dp k then "First" else "Second"
;;

let () = ans |> print_endline
