//##// Contest ID: typical90
//##// Problem ID: typical90_b ( https://atcoder.jp/contests/typical90/tasks/typical90_b )
//##// Title: 002. Encyclopedia of Parentheses（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 06:23:04 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34524026 ) 

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

let rec make str left right =
  if left < nn / 2 then make (str ^ "(") (left + 1) right;
  if right < left then make (str ^ ")") left (right + 1);
  if left + right = nn then ps str
;;

let () =
  if nn % 2 = 1 then print_string "" else
  make "" 0 0