//##// Contest ID: abc260
//##// Problem ID: abc260_a ( https://atcoder.jp/contests/abc260/tasks/abc260_a )
//##// Title: A. A Unique Letter
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-17 13:19:59 +0000 UTC ( https://atcoder.jp/contests/abc260/submissions/33316189 ) 

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
let pc d = printf "%c\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

(************)
let ss = Array.init 3 ~f:sc

let () =
  let i = 0 in
  if Char.(ss.(i) <> ss.((i + 1) % 3) && ss.(i) <> ss.((i + 2) % 3))
  then pc ss.(i)
  else (
    let i = 1 in
    if Char.(ss.(i) <> ss.((i + 1) % 3) && ss.(i) <> ss.((i + 2) % 3))
    then pc ss.(i)
    else (
      let i = 2 in
      if Char.(ss.(i) <> ss.((i + 1) % 3) && ss.(i) <> ss.((i + 2) % 3))
      then pc ss.(i)
      else pi (-1)))
;;
