//##// Contest ID: math-and-algorithm
//##// Problem ID: typical90_bz ( https://atcoder.jp/contests/math-and-algorithm/tasks/typical90_bz )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-10 12:20:55 +0000 UTC ( https://atcoder.jp/contests/math-and-algorithm/submissions/38757127 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Hashtbl.create (module Int)

let () =
  (1 -- m) (fun _ ->
    let u, v = Scanf.scanf " %d %d" Tuple2.create in
    let u, v = u - 1, v - 1 in
    let u, v = Int.(min u v, max u v) in
    Hashtbl.add_multi graph ~key:v ~data:u)
;;

let () =
  Hashtbl.fold graph ~init:0 ~f:(fun ~key ~data cnt ->
    match data with
    | [ _ ] -> cnt + 1
    | _ -> cnt)
  |> Printf.printf "%d\n"
;;
