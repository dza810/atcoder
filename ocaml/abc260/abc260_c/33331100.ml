//##// Contest ID: abc260
//##// Problem ID: abc260_c ( https://atcoder.jp/contests/abc260/tasks/abc260_c )
//##// Title: C. Changing Jewels
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-18 01:38:25 +0000 UTC ( https://atcoder.jp/contests/abc260/submissions/33331100 ) 

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
let nn, xx, yy = si3 ()
let red = Hashtbl.create (module Int)
let blue = Hashtbl.create (module Int)

let rec from_red l =
  if l = 1 then 0 else
  Hashtbl.find_or_add red l ~default:(fun () ->
      (1 * from_red (l - 1)) + (xx * from_blue l))

and from_blue l =
  if l = 1 then 1 else
  Hashtbl.find_or_add blue l ~default:(fun () ->
      (1 * from_red (l - 1)) + (yy * from_blue (l - 1)))
;;

let () =
  1 * from_red nn |> pi
;;
