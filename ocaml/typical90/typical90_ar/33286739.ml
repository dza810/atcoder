//##// Contest ID: typical90
//##// Problem ID: typical90_ar ( https://atcoder.jp/contests/typical90/tasks/typical90_ar )
//##// Title: 044. Shift and Swapping（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-17 08:25:55 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33286739 ) 

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
let nn, qq = si2 ()
let aa = Array.init nn ~f:si
let shft_right = ref 0

let () =
  (1 -- qq) (fun _ ->
      let t, x, y = si3 () in
      let x, y = (x - 1 - !shft_right) % nn, (y - 1 - !shft_right) % nn in
      match t with
      | 1 -> Array.swap aa x y
      | 2 -> incr shft_right
      | 3 -> pi @@ aa.(x)
      | _ -> failwith "")
;;
