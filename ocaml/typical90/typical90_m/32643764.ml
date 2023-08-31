//##// Contest ID: typical90
//##// Problem ID: typical90_m ( https://atcoder.jp/contests/typical90/tasks/typical90_m )
//##// Title: 013. Passing（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-21 13:00:14 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32643764 ) 

open Core
open Printf

(* open Num *)
(* open IterLabels *)

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

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let option_either l ~f =
  List.fold l ~init:None ~f:(fun acc x ->
      match acc with
      | None -> f x
      | Some x -> Some x)
;;

(************)
let nn, mm = si2 ()
let ps = Hashtbl.create (module Int)
let cost = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))

let abc =
  1 -- mm
  >>| fun _ ->
  let a, b, c = si3 () in
  let a, b = a - 1, b - 1 in
  Hashtbl.add_multi ps ~key:a ~data:b;
  Hashtbl.add_multi ps ~key:b ~data:a;
  Hashtbl.add_exn cost ~key:(a, b) ~data:c;
  Hashtbl.add_exn cost ~key:(b, a) ~data:c
;;

let dijkstra l ps cost s =
  let ans = Array.init l ~f:(fun _ -> Int.max_value) in
  ans.(s) <- 0;
  let q = Queue.create () in
  Queue.enqueue q s;
  let rec aux () =
    match Queue.dequeue q with
    | None -> ans
    | Some p ->
      let nps = Hashtbl.find_multi ps p in
      nps
      |> iter ~f:(fun np ->
             let x = ans.(p) + Option.value ~default:0 (Hashtbl.find cost (np, p)) in
             if ans.(np) > x
             then (
               ans.(np) <- x;
               Queue.enqueue q np));
      aux ()
  in
  aux ()
;;

let () =
  let a = dijkstra nn ps cost 0 in
  let b = dijkstra nn ps cost (nn - 1) in
  1 -- nn
  |> iter ~f:(fun k ->
         let k = k - 1 in
         pi @@ (a.(k) + b.(k)))
;;
