//##// Contest ID: typical90
//##// Problem ID: typical90_az ( https://atcoder.jp/contests/typical90/tasks/typical90_az )
//##// Title: 052. Dice Product（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-17 12:48:22 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33309757 ) 

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
let aa = Array.init nn ~f:(fun _ -> Array.init 6 ~f:si)
let m x = x % 1_000_000_007

let () =
  aa
  |> Array.map ~f:(fun x -> Array.fold x ~init:0 ~f:(fun acc x -> acc + x |> m))
  |> Array.fold ~init:1 ~f:(fun acc x -> acc * x |> m)
  |> pi
;;
