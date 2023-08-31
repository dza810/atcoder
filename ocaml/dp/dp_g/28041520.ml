//##// Contest ID: dp
//##// Problem ID: dp_g ( https://atcoder.jp/contests/dp/tasks/dp_g )
//##// Title: G. Longest Path
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-12-20 23:50:00 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/28041520 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)
let n = scanf "%d " id
let m = scanf "%d " id
let xs = List.init m ~f:(fun _ -> scanf "%d %d " (fun x y -> x, y))
let zs = Array.init n ~f:(fun _ -> [])
let () = xs |> List.iter ~f:(fun (x, y) -> zs.(x - 1) <- (y - 1) :: zs.(x - 1))

(* let zs = *)
(*   Array.init n ~f:(fun i -> *)
(*       xs |> List.filter_map ~f:(fun (x, y) -> if i = (x - 1) then Some (y - 1) else None)) *)
(* ;; *)

(* *)
let dp = Hashtbl.create (module Int)

let rec calc i =
  Hashtbl.find_or_add dp i ~default:(fun () ->
      zs.(i) |> List.map ~f:(fun k -> calc k + 1) |> List.fold ~init:0 ~f:max)
;;

let () = List.init n ~f:(fun i -> calc i) |> List.fold ~init:0 ~f:max |> printf "%d\n"
