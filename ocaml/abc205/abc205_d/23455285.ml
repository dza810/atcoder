//##// Contest ID: abc205
//##// Problem ID: abc205_d ( https://atcoder.jp/contests/abc205/tasks/abc205_d )
//##// Title: D. Kth Excluded
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-13 14:02:17 +0000 UTC ( https://atcoder.jp/contests/abc205/submissions/23455285 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id
let q = scanf "%d " id
let an = Array.init n ~f:(fun _ -> scanf "%d " id)
let ks = List.init q ~f:(fun _ -> scanf "%d\n" id) |> List.rev
let ds = Array.init (n + 2) ~f:(fun _ -> 0)

let () =
  ds.(1) <- an.(0) - 1;
  for i = 1 to n - 1 do
    ds.(i + 1) <- an.(i) - an.(i - 1) - 1 + ds.(i)
  done;
  ds.(n + 1) <- Int.max_value
;;

let rec bin_search ~f l r =
  if r - l < 2
  then r
  else (
    let v = l + ((r - l) / 2) in
    if f v then bin_search ~f l v else bin_search ~f v r)
;;

(* *)
let () =
  (* *)
  let rec aux = function
    | [] -> ()
    | k :: ks ->
      let f i = k <= ds.(i) in
      let i = bin_search ~f (-1) (n + 1) - 1 in
      let a = if i = 0 then 0 else if i = n + 1 then invalid_arg "" else an.(i - 1) in
      k - ds.(i) + a |> printf "%d\n";
      aux ks
  in
  aux ks
;;
