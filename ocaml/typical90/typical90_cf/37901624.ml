//##// Contest ID: typical90
//##// Problem ID: typical90_cf ( https://atcoder.jp/contests/typical90/tasks/typical90_cf )
//##// Title: 084. There are two types of characters（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 08:53:21 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37901624 ) 

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
let nnn = nn
let aa = Array.init nn ~f:sc

let aa =
  aa
  |> Array.fold ~init:[] ~f:(fun acc v ->
         match acc with
         | (x, c) :: xs when Char.(x = v) -> (x, c + 1) :: xs
         | _ -> (v, 1) :: acc)

let () =
  let cnt =
    aa |> List.fold ~init:0 ~f:(fun acc (_, x) -> acc + (x * (x + 1) / 2))
  in
  pi @@ ((nnn * (nnn + 1) / 2) - cnt)
