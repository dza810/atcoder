//##// Contest ID: typical90
//##// Problem ID: typical90_p ( https://atcoder.jp/contests/typical90/tasks/typical90_p )
//##// Title: 016. Minimum Coins（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-24 12:16:40 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32691210 ) 

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

(************)
let nn = si ()
let aa, bb, cc = si3 ()

let () =
  let ans =
    0 -- 9999
    |> fold ~init:Int.max_value ~f:(fun acc a ->
           0 -- (9999 - a)
           |> fold ~init:acc ~f:(fun acc b ->
                  let rest = nn - (a * aa) - (b * bb) in
                  if rest >= 0 && rest mod cc = 0
                  then (
                    let c = rest / cc in
                    Int.min acc (a + b + c))
                  else acc))
  in
  pi ans
;;
