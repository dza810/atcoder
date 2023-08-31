//##// Contest ID: typical90
//##// Problem ID: typical90_c ( https://atcoder.jp/contests/typical90/tasks/typical90_c )
//##// Title: 003. Longest Circular Road（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 07:39:53 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34525797 ) 

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

(************)
let nn = si ()
let ab = Hashtbl.create (module Int)

let () =
  (1 -- (nn - 1)) (fun _ ->
      let a, b = si2 () in
      let a, b = a - 1, b - 1 in
      Hashtbl.add_multi ab ~key:a ~data:b;
      Hashtbl.add_multi ab ~key:b ~data:a)
;;

let max_depth i =
  let arr = Array.init nn ~f:(fun _ -> -1) in
  let q = Queue.create () in
  arr.(i) <- 0;
  Queue.enqueue q i;
  let rec aux () =
    match Queue.dequeue q with
    | None -> ()
    | Some x ->
      Hashtbl.find_multi ab x
      |> List.iter ~f:(fun y ->
             if arr.(y) = -1
             then (
               arr.(y) <- arr.(x) + 1;
               Queue.enqueue q y));
      aux ()
  in
  aux ();
  arr
;;

let () =
  let x, _ =
    max_depth 0
    |> Array.foldi ~init:(0, 0) ~f:(fun i (acci, accv) x ->
           if accv < x then i, x else acci, accv)
  in
  let _, v =
    max_depth x
    |> Array.foldi ~init:(0, 0) ~f:(fun i (acci, accv) x ->
           if accv < x then i, x else acci, accv)
  in
  pi @@ (v + 1)
;;
