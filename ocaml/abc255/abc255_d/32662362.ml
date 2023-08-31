//##// Contest ID: abc255
//##// Problem ID: abc255_d ( https://atcoder.jp/contests/abc255/tasks/abc255_d )
//##// Title: D. ±1 Operation 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-22 14:54:02 +0000 UTC ( https://atcoder.jp/contests/abc255/submissions/32662362 ) 

open Core
open Printf

(* open Num *)
(* open IterLabels *)

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)
let ( >|| ) x f = iter ~f x
let sort_int = sort ~compare:Int.compare

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let option_either l ~f =
  List.fold l ~init:None ~f:(fun acc x ->
      match acc with
      | None -> f x
      | Some x -> Some x)
;;

(************)
let nn = si ()
let qq = si ()
let aa = 1 -- nn >>| si |> sort_int
let xx = 1 -- qq >>| si

let left_sum =
  fold_map aa ~init:0 ~f:(fun acc x ->
      let y = acc + x in
      y, y)
  |> snd
  |> Array.of_list
;;

let right_sum =
  aa
  |> rev
  |> fold_map ~init:0 ~f:(fun acc x ->
         let y = acc + x in
         y, y)
  |> snd
  |> rev
  |> Array.of_list
;;

let left_sum x = if 0 <= x && x < nn then left_sum.(x) else 0
let right_sum x = if 0 <= x && x < nn then right_sum.(x) else 0
let aa = aa |> Array.of_list

let rec bin_search f l r =
  if r - l <= 1
  then l, r
  else (
    let c = ((r - l) / 2) + l in
    if f c then bin_search f l c else bin_search f c r)
;;

let () =
  xx
  >|| fun x ->
  let k, _ = bin_search (fun a -> aa.(a) > x) (-1) nn in
  let ls = left_sum k in
  let rs = right_sum (k + 1) in
  (((2 * (k + 1)) - nn) * x) - ls + rs |> pi
;;
