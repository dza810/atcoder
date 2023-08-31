//##// Contest ID: typical90
//##// Problem ID: typical90_bl ( https://atcoder.jp/contests/typical90/tasks/typical90_bl )
//##// Title: 064. Uplift（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-07 15:00:32 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37856028 ) 

open Core
open Printf
open Num
open Scanf
open IterLabels

let id x = x
let si _ = scanf " %d" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi x = printf "%d\n" x

(************)

let nn, qq = si2 ()
let aa = Array.init nn ~f:si
let aa = Array.init (nn - 1) ~f:(fun i -> aa.(i + 1) - aa.(i))
let ans = ref @@ Array.fold aa ~init:0 ~f:(fun acc x -> acc + Int.abs x)
let get arr n = try arr.(n) with _ -> 0
let set arr n v = try arr.(n) <- v with _ -> ()

let loop _ =
  let l = si () - 1 in
  let r = si () - 1 in
  let v = si () in
  let b = Int.abs (get aa (l - 1)) + Int.abs (get aa r) in
  set aa (l - 1) @@ (get aa (l - 1) + v);
  set aa r @@ (get aa r - v);
  let a = Int.abs (get aa (l - 1)) + Int.abs (get aa r) in
  ans := !ans + (a - b);
  pi !ans

let () =
  for _ = 1 to qq do
    loop ()
  done
