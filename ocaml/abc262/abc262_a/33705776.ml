//##// Contest ID: abc262
//##// Problem ID: abc262_a ( https://atcoder.jp/contests/abc262/tasks/abc262_a )
//##// Title: A. World Cup
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-01 07:00:10 +0000 UTC ( https://atcoder.jp/contests/abc262/submissions/33705776 ) 

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
let yy = si ()

let () =
  let x = yy % 4 in
  (match x with
  | 0 -> yy + 2
  | 1 -> yy + 1
  | 2 -> yy
  | 3 -> yy + 3
  | _ -> failwith "")
  |> pi
;;
