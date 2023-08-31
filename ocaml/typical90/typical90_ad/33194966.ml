//##// Contest ID: typical90
//##// Problem ID: typical90_ad ( https://atcoder.jp/contests/typical90/tasks/typical90_ad )
//##// Title: 030. K Factors（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-13 02:36:52 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33194966 ) 

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
let ( >|| ) x f = iter ~f x
let sort_int = sort ~compare:Int.compare

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
let nn, kk = si2 ()
let tbl = Array.init 10_000_001 ~f:(fun _ -> 0)

let () =
  for i = 2 to nn do
    if tbl.(i) <> 0
    then ()
    else
      for j = 1 to nn / i do
        tbl.(i * j) <- tbl.(i * j) + 1
      done
  done
;;

let () = tbl |> Array.count ~f:(( <= ) kk) |> pi
