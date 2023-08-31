//##// Contest ID: dp
//##// Problem ID: dp_e ( https://atcoder.jp/contests/dp/tasks/dp_e )
//##// Title: E. Knapsack 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-12-20 20:34:15 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/28040707 ) 

open Core
open Printf
open Scanf
open Num

let id x = x
let n_max = 100
let vi_max = 1000
let v_max = n_max * vi_max
let w_max = 1_000_000_000
let inf = n_max * w_max * 1000

(* *)

let n = scanf "%d " id
let w = scanf "%d " id
let xs = Array.init n ~f:(fun _ -> Array.init 2 ~f:(fun _ -> scanf "%d " id))
let wi i = xs.(i - 1).(0)
let vi i = xs.(i - 1).(1)
let dp = Array.init (n + 1) ~f:(fun _ -> Array.init (v_max + 1) ~f:(fun _ -> None))
let () = dp.(0).(0) <- Some 0

(* *)
let rec weight i v =
  match dp.(i).(v) with
  | Some x -> x
  | None ->
    let out =
      assert (v >= 0 && i >= 0);
      if i = 0
      then inf
      else (
        let off = weight (i - 1) v in
        let on = if v - vi i >= 0 then weight (i - 1) (v - vi i) + wi i else inf in
        min off on)
    in
    dp.(i).(v) <- Some out;
    out
;;

let () =
  for v = 0 to v_max do
    let (_ : int) = weight n v in
    ()
  done;
  let v =
    dp.(n)
    |> Array.foldi ~init:0 ~f:(fun v acc u ->
           match u with
           | Some u when u <= w -> max acc v
           | _ -> acc)
  in
  v |> printf "%d\n"
;;
