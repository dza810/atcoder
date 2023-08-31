//##// Contest ID: abc263
//##// Problem ID: abc263_b ( https://atcoder.jp/contests/abc263/tasks/abc263_b )
//##// Title: B. Ancestor
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-18 05:25:15 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34120991 ) 

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

let tbl = Array.init 51 ~f:(fun _ -> 0)

let () =
  (2 -- nn) (fun i ->
    let pi = si () in
    tbl.(i) <- pi
    )

let rec loop cnt i =
  let pi = tbl.(i) in
  let cnt = cnt + 1 in
  if pi = 1 then cnt else loop cnt pi

let () =
  loop 0 nn |> pi