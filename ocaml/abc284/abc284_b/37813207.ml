//##// Contest ID: abc284
//##// Problem ID: abc284_b ( https://atcoder.jp/contests/abc284/tasks/abc284_b )
//##// Title: B. Multi Test Cases
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-07 12:18:49 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/37813207 ) 

open Core
open Printf
open Scanf

let id x = x
let si _ = scanf " %d" id
let pi x = printf "%d\n" x
(************)

let tt = si ()

let () =
  for _ = 1 to tt do
    let nn = si () in
    List.init nn ~f:si
    |> List.filter ~f:(fun x -> x % 2 = 1)
    |> List.length |> pi
  done