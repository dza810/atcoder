//##// Contest ID: abc261
//##// Problem ID: abc261_a ( https://atcoder.jp/contests/abc261/tasks/abc261_a )
//##// Title: A. Intersection
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-26 06:23:43 +0000 UTC ( https://atcoder.jp/contests/abc261/submissions/33528816 ) 

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
let tbl = Array.init 101 ~f:(fun _ -> 0)

let () =
  (1 -- 2) (fun _ ->
      let l, r = si2 () in
      tbl.(l) <- tbl.(l) + 1;
      tbl.(r) <- tbl.(r) - 1)
;;

let () =
  tbl
  |> Array.fold ~init:(0, 0) ~f:(fun (ans, acc) x ->
         let acc = acc + x in
         if acc >= 2 then ans + 1, acc else ans, acc)
  |> fst
  |> pi
;;
