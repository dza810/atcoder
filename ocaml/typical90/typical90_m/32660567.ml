//##// Contest ID: typical90
//##// Problem ID: typical90_m ( https://atcoder.jp/contests/typical90/tasks/typical90_m )
//##// Title: 013. Passing（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-22 13:12:54 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32660567 ) 

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
let sort_int = sort ~compare:Int.compare
let ( >|| ) x f = iter ~f x

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
let edges = Hashtbl.create (module Int)
let costs = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))

(* input abc *)
let () =
  let f _ =
    let a, b, c = si3 () in
    let a = a - 1 in
    let b = b - 1 in
    Hashtbl.add_multi edges ~key:a ~data:b;
    Hashtbl.add_multi edges ~key:b ~data:a;
    Hashtbl.add_exn costs ~key:(a, b) ~data:c;
    Hashtbl.add_exn costs ~key:(b, a) ~data:c
  in
  1 -- mm >|| f
;;

let dijkstra s =
  let ans = Array.init nn ~f:(fun _ -> Int.max_value) in
  ans.(s) <- 0;
  let q = Queue.create () in
  Queue.enqueue q s;
  let rec aux () =
    match Queue.dequeue q with
    | None -> ans
    | Some p ->
      (Hashtbl.find_multi edges p
      >|| fun np ->
      let nv = ans.(p) + Option.value ~default:0 (Hashtbl.find costs (np, p)) in
      if ans.(np) > nv then (ans.(np) <- nv; Queue.enqueue q np));
      aux ()
  in
  aux ()
;;

let () =
  let fp = dijkstra 0 in
  let sp = dijkstra (nn - 1) in
  0 -- (nn - 1) >|| fun k -> fp.(k) + sp.(k) |> pi
;;
