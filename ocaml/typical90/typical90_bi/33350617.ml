//##// Contest ID: typical90
//##// Problem ID: typical90_bi ( https://atcoder.jp/contests/typical90/tasks/typical90_bi )
//##// Title: 061. Deck（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-18 23:04:32 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33350617 ) 

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
let qq = si ()

let (_ : _) =
  1 -- qq
  |> fold ~init:(0, 0, [], []) ~f:(fun (ul, dl, up, down) _ ->
         let t, x = si2 () in
         if t = 1
         then ul + 1, dl, x :: up, down
         else if t = 2
         then ul, dl + 1, up, x :: down
         else if t = 3
         then (
           pi
           @@
           if ul > 0 && x <= ul
           then List.nth_exn up (x - 1)
           else (
             let x = x - ul in
             List.nth_exn down (dl - x));
           ul, dl, up, down)
         else failwith "")
;;
