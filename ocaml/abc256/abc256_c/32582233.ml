//##// Contest ID: abc256
//##// Problem ID: abc256_c ( https://atcoder.jp/contests/abc256/tasks/abc256_c )
//##// Title: C. Filling 3x3 array
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-19 02:54:16 +0000 UTC ( https://atcoder.jp/contests/abc256/submissions/32582233 ) 

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

let hs = 1 -- 3 >>| si |> Array.of_list
let ws = 1 -- 3 >>| si |> Array.of_list

let check xs =
  let xs = xs |> Array.of_list in
  (* h *)
  let ax3 =
    0 -- 1
    >>| fun i -> 0 -- 1 |> fold ~init:hs.(i) ~f:(fun acc j -> acc - xs.((2 * i) + j))
  in
  let a3x =
    0 -- 1
    >>| fun j -> 0 -- 1 |> fold ~init:ws.(j) ~f:(fun acc i -> acc - xs.((2 * i) + j))
  in
  List.for_all ax3 ~f:(fun x -> x > 0)
  && List.for_all a3x ~f:(fun x -> x > 0)
  && ax3 |> fold ~init:ws.(2) ~f:( - ) > 0
  && a3x |> fold ~init:hs.(2) ~f:( - ) > 0
;;

let rec calc ans masu ij =
  if ij = 4
  then ans + if check masu then 1 else 0
  else
    1 -- 30
    >>| (fun x ->
          let masu = x :: masu in
          calc ans masu (ij + 1))
    |> fold ~init:0 ~f:( + )
;;

let ans =
  if Array.fold hs ~init:0 ~f:( + ) <> Array.fold ws ~init:0 ~f:( + )
  then 0
  else calc 0 [] 0
;;

let () = pi ans
