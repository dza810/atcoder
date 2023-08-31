//##// Contest ID: typical90
//##// Problem ID: typical90_bf ( https://atcoder.jp/contests/typical90/tasks/typical90_bf )
//##// Title: 058. Original Calculator（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-18 22:35:10 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33350484 ) 

open Core
open Printf

(* open Num *)
open IterLabels

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
(************)

let nn, kk = si2 ()
let tbl = Array.init 100_000 ~f:(fun _ -> -1)

let rec press_x flg i x =
  if i = 0
  then x
  else if flg && tbl.(x) <> -1
  then (
    let i = i % (tbl.(x) - i) in
    press_x false i x)
  else (
    tbl.(x) <- i;
    let rec sum_digit x sum =
      (* 6 *)
      if x = 0 then sum else sum_digit (x / 10) (sum + (x % 10))
    in
    let y = sum_digit x 0 in
    let z = (x + y) % 100_000 in
    press_x flg (i - 1) z)
;;

let () = press_x true kk nn |> pi
