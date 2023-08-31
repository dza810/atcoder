//##// Contest ID: typical90
//##// Problem ID: typical90_bw ( https://atcoder.jp/contests/typical90/tasks/typical90_bw )
//##// Title: 075. Magic For Balls（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-08 11:55:27 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37881275 ) 

open Core
open Printf
open Num
open Scanf
open IterLabels

let id x = x
let si _ = scanf " %d" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi x = printf "%d\n" x

(************)
let nn = si ()

let rec loop cnt n i =
  if i * i > n then cnt
  else if n % i = 0 then loop (cnt + 1) (n / i) i
  else loop cnt n (i + 1)

let () =
  let x = loop 1 nn 2 in
   x |> Int.ceil_log2 |> pi
