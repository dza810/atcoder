//##// Contest ID: abc260
//##// Problem ID: abc260_b ( https://atcoder.jp/contests/abc260/tasks/abc260_b )
//##// Title: B. Better Students Are Needed!
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-18 01:05:42 +0000 UTC ( https://atcoder.jp/contests/abc260/submissions/33330620 ) 

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
let xx, yy, zz = si3 ()

let math =
  Array.init nn ~f:(fun i -> si (), i)
;;

let english =
  Array.init nn ~f:(fun i -> si (), i)
;;

let total =
  Array.zip_exn math english |> Array.mapi ~f:(fun i ((m,mi),(e,ei)) -> if mi = ei then (m + e, i) else failwith "")

let sort = Array.sorted_copy ~compare:(fun x y ->
  (- 10 * Int.compare (fst x) (fst y)) + Int.compare (snd x) (snd y))

let math = sort math
let english = sort english
let total = sort total

let passed = Array.init nn ~f:(fun _ -> false)
let () =
  let _:int = math |> Array.fold ~init:0 ~f:(fun acc (_,n) -> if acc < xx && not passed.(n) then (passed.(n) <- true ; acc + 1) else acc) in
  let _:int = english |> Array.fold ~init:0 ~f:(fun acc (_,n) -> if acc < yy && not passed.(n) then (passed.(n) <- true ; acc + 1) else acc) in
  let _:int = total |> Array.fold ~init:0 ~f:(fun acc (_,n) -> if acc < zz && not passed.(n) then (passed.(n) <- true ; acc + 1) else acc) in
  passed |> Array.iteri ~f:(fun i x -> if x then pi (i + 1))

