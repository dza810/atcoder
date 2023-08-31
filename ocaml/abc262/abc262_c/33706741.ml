//##// Contest ID: abc262
//##// Problem ID: abc262_c ( https://atcoder.jp/contests/abc262/tasks/abc262_c )
//##// Title: C. Min Max Pair
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-01 07:40:52 +0000 UTC ( https://atcoder.jp/contests/abc262/submissions/33706741 ) 

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

let nn = si ()
let aa = Array.init nn ~f:si
let normal_num = aa |> Array.filteri ~f:(fun i a -> i + 1 = a) |> Array.length

let swap_num =
  aa
  |> Array.filteri ~f:(fun i a ->
         if i + 1 >= a then false else if aa.(aa.(i) - 1) = i + 1 then true else false)
  |> Array.length
;;

let () = (normal_num * (normal_num - 1) / 2) + swap_num |> pi
