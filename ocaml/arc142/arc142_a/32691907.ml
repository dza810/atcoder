//##// Contest ID: arc142
//##// Problem ID: arc142_a ( https://atcoder.jp/contests/arc142/tasks/arc142_a )
//##// Title: A. Reverse and Minimize
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-24 12:57:43 +0000 UTC ( https://atcoder.jp/contests/arc142/submissions/32691907 ) 

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
let nn = si ()
let kk = si ()

let rev k =
  let rec aux k out = if k = 0 then out else aux (k / 10) ((out * 10) + (k mod 10)) in
  aux k 0
;;

let check_k k =
  let rev = rev k in
  k <= rev
;;

let () =
  if not @@ check_k kk
  then pi 0
  else if nn < kk then pi 0
  else if nn = kk then pi 1
  else (
    let l = nn / kk |>  Int.to_string  |> String.length in
    let lr = if rev kk = kk then 0 else nn / rev kk |> Int.to_string |> String.length in
    l + lr |> pi)
;;
