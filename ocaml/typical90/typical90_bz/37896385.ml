//##// Contest ID: typical90
//##// Problem ID: typical90_bz ( https://atcoder.jp/contests/typical90/tasks/typical90_bz )
//##// Title: 078. Easy Graph Problem（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 04:46:37 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37896385 ) 

open Core
open Printf
open Num
open Scanf
open IterLabels

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi x = printf "%d\n" x

(************)

let nn, mm = si2 ()
let tbl = Hashtbl.create (module Int)

let () =
  for _ = 1 to mm do
    let a, b = si2 () in
    Hashtbl.add_multi tbl ~key:a ~data:b;
    Hashtbl.add_multi tbl ~key:b ~data:a
  done

let () =
  Hashtbl.fold tbl ~init:0 ~f:(fun ~key ~data acc ->
      let l = data |> List.filter ~f:(fun d -> d < key) |> List.length in
      if l = 1 then acc + 1 else acc)
  |> pi
