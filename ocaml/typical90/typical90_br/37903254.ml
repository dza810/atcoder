//##// Contest ID: typical90
//##// Problem ID: typical90_br ( https://atcoder.jp/contests/typical90/tasks/typical90_br )
//##// Title: 070. Plant Planning（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 10:16:17 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37903254 ) 

open Core
open Printf
open Num
open Scanf
open IterLabels

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi x = printf "%d\n" x
let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2
(************)

let nn = si ()
let xy = Array.init nn ~f:si2

let xx =
  let t = xy |> Array.map ~f:fst |> Array.sorted_copy ~compare:Int.compare in
  t.(nn / 2)

let yy =
  let t = xy |> Array.map ~f:snd |> Array.sorted_copy ~compare:Int.compare in
  t.(nn / 2)

let () =
  xy
  |> Array.fold ~init:0 ~f:(fun acc (x, y) ->
         acc + Int.abs (x - xx) + Int.abs (y - yy))
  |> pi
