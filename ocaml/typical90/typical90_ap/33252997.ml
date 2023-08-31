//##// Contest ID: typical90
//##// Problem ID: typical90_ap ( https://atcoder.jp/contests/typical90/tasks/typical90_ap )
//##// Title: 042. Multiple of 9（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-16 07:36:56 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33252997 ) 

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
let sum_digit = si ()
let m x = x % 1_000_000_007
let tbl = Hashtbl.create (module Int)

let rec dp x =
  Hashtbl.find_or_add tbl x ~default:(fun () ->
      if x < 0 then 0 else
      if x = 0 then 1
      else 1 -- 9 >|= (fun i -> dp (x - i)) |> fold ~init:0 ~f:(fun acc x -> m (acc + x)))
;;

let () = pi @@ if sum_digit % 9 = 0 then dp sum_digit else 0
