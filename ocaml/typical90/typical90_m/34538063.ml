//##// Contest ID: typical90
//##// Problem ID: typical90_m ( https://atcoder.jp/contests/typical90/tasks/typical90_m )
//##// Title: 013. Passing（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 12:07:42 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34538063 ) 

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

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d \n" x else printf "%d " x;
        acc - 1)
  in
  ()
;;

let cache tbl key ~f =
  match Stdlib.Hashtbl.find_opt tbl key with
  | Some x -> x
  | None ->
    let x = f () in
    Stdlib.Hashtbl.add tbl key x;
    x
;;

let i2f x = Int.to_float x

(************)
let nn, mm = si2 ()
let abc = Array.init mm ~f:si3
let cost = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))
let edge = Hashtbl.create (module Int)

let () =
  abc
  |> Array.iter ~f:(fun (a, b, c) ->
         Hashtbl.add_exn cost ~key:(a, b) ~data:c;
         Hashtbl.add_exn cost ~key:(b, a) ~data:c)
;;

let () =
  abc
  |> Array.iter ~f:(fun (a, b, _) ->
         Hashtbl.add_multi edge ~key:a ~data:b;
         Hashtbl.add_multi edge ~key:b ~data:a)
;;

let dfs i =
  let arr = Array.init (nn + 1) ~f:(fun _ -> Int.max_value_30_bits) in
  let q = Queue.create () in
  Queue.enqueue q i;
  arr.(i) <- 0;
  let rec aux () =
    match Queue.dequeue q with
    | None -> ()
    | Some x ->
      Hashtbl.find_multi edge x
      |> List.iter ~f:(fun y ->
             let nv = arr.(x) + Hashtbl.find_exn cost (x, y) in
             if arr.(y) > nv
             then (
               arr.(y) <- nv;
               Queue.enqueue q y));
      aux ()
  in
  aux ();
  arr
;;

let () =
  let left = dfs 1 in
  let right = dfs nn in
  for k = 1 to nn do
    pi @@ (left.(k) + right.(k))
  done
;;
