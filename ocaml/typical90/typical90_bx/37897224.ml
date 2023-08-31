//##// Contest ID: typical90
//##// Problem ID: typical90_bx ( https://atcoder.jp/contests/typical90/tasks/typical90_bx )
//##// Title: 076. Cake Cut（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 05:33:19 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37897224 ) 

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

(************)
let nn = si ()
let aa = Array.init nn ~f:(fun _ -> si ())
let target = Array.fold ~init:0 ~f:( + ) aa

let aa =
  Array.init (nn * 2) ~f:(fun _ -> 0)
  |> Array.folding_mapi ~init:0 ~f:(fun i acc _ ->
         let acc = (10 * aa.(i % nn)) + acc in
         (acc, acc))

let rec bin_search ~f l r =
  if r - l = 1 then l
  else
    let c = ((r - l) / 2) + l in
    if f c then bin_search ~f l c else bin_search ~f c r

let rec loop () =
  0 -- (nn - 1)
  |> fold_while ~init:false ~f:(fun _ l ->
         let f c = aa.(c) - aa.(l) > target in
         let r = bin_search ~f l (nn * 2) in
         if aa.(r) - aa.(l) = target then (true, `Stop) else (false, `Continue))

let () = print_endline (if loop () then "Yes" else "No")
