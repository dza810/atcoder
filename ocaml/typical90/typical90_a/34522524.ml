//##// Contest ID: typical90
//##// Problem ID: typical90_a ( https://atcoder.jp/contests/typical90/tasks/typical90_a )
//##// Title: 001. Yokan Party（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 04:58:49 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34522524 ) 

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
let nn, ll = si2 ()
let kk = si ()
let aa = Array.init (nn + 1) ~f:(fun i -> if i = 0 then 0 else si ())
let ftbl = Stdlib.Hashtbl.create 1_000_000

let f l =
  cache ftbl l ~f:(fun () ->
      let rec aux cnt s e =
        if cnt = 0
        then ll - aa.(e) >= l
        else if s > nn || e > nn
        then false
        else if aa.(e) - aa.(s) >= l
        then aux (cnt - 1) e e
        else aux cnt s (e + 1)
      in
      aux kk 0 0)
;;

let rec bin_search f l r =
  if r - l <= 1
  then l
  else (
    let c = ((r - l) / 2) + l in
    if f c then bin_search f c r else bin_search f l c)
;;

let () = bin_search f 1 ll |> pi
