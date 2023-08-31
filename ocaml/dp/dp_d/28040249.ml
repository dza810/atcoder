//##// Contest ID: dp
//##// Problem ID: dp_d ( https://atcoder.jp/contests/dp/tasks/dp_d )
//##// Title: D. Knapsack 1
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-12-20 18:18:09 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/28040249 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id
let w = scanf "%d " id
let xs = Array.init n ~f:(fun _ -> Array.init 2 ~f:(fun _ -> scanf "%d " id))
let wi i = xs.(i).(0)
let vi i = xs.(i).(1)

(* *)
let dp = Array.init n ~f:(fun _ -> Array.init (w + 1) ~f:(fun _ -> 0))

let rec value i u =
  if i < 0
  then 0
  else if dp.(i).(u) = 0
  then (
    let off = value (i - 1) u in
    let on = if u - wi i >= 0 then vi i + value (i - 1) (u - wi i) else 0 in
    dp.(i).(u) <- max on off;
    dp.(i).(u))
  else dp.(i).(u)
;;

let () = value (n - 1) w |> printf "%d\n"
