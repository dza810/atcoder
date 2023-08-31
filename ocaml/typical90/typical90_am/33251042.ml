//##// Contest ID: typical90
//##// Problem ID: typical90_am ( https://atcoder.jp/contests/typical90/tasks/typical90_am )
//##// Title: 039. Tree Distance（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-16 05:49:59 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33251042 ) 

open Core
open Printf

(* open Num *)
open IterLabels

let si _ = Scanf.scanf " %d" ident
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" ident
let ss _ = Scanf.scanf " %s" ident
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

let pl ~f l =
  List.iteri l ~f:(fun i x ->
      if i <> 0 then print_string " ";
      f x);
  Out_channel.newline stdout
;;

(************)
let nn = si ()
let ab = Hashtbl.create (module Int)

let ab_array =
  Array.init (nn - 1) ~f:(fun _ ->
      let a, b = si2 () in
      Hashtbl.add_multi ab ~key:a ~data:b;
      Hashtbl.add_multi ab ~key:b ~data:a;
      a, b)
;;

let dfs_tbl = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))

let rec v_num pos pre =
  Hashtbl.find_or_add dfs_tbl (pos, pre) ~default:(fun () ->
      let ans =
        let bs = Hashtbl.find_multi ab pos |> List.filter ~f:(fun b -> b <> pre) in
        match bs with
        | [] -> 1
        | bs -> bs |> List.fold ~init:1 ~f:(fun acc b -> acc + v_num b pos)
      in
      ans)
;;

let () =
  let x =
    0 -- (nn - 2)
    >|= fun i ->
    let a, b = ab_array.(i) in
    let x = v_num a b in
    x * (nn - x)
  in
  x |> fold ~init:0 ~f:( + ) |> pi
;;
