//##// Contest ID: typical90
//##// Problem ID: typical90_a ( https://atcoder.jp/contests/typical90/tasks/typical90_a )
//##// Title: 001. Yokan Party（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-06 14:01:56 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32291442 ) 

open Core
open Printf
open Scanf
open Num

let inf = Int.max_value
let id x = x
let nn = Scanf.scanf "%d " id
let ll = Scanf.scanf "%d " id
let kk = Scanf.scanf "%d " id

let aa =
  let f _ = Scanf.scanf "%d " id in
  Array.init nn ~f
;;

let comp l =
  let mm, last, n =
    aa
    |> Array.fold ~init:(inf, 0, 0) ~f:(fun (mm, last, n) x ->
           if x - last >= l && ll - x >= l
           then (
             let mm = min mm (x - last) in
             let last = x in
             mm, last, n + 1)
           else mm, last, n)
  in
  let mm = min mm (ll - last) in
  n, mm
;;

let () =
  let rec aux l r =
    let c = ((r - l) / 2) + l in
    let n, _ = comp c in
    if r - l <= 1 then l else if n >= kk then aux c r else aux l c
  in
  let l = aux 0 ll in
  let _, mm = comp l in
  mm |> printf "%d\n"
;;
