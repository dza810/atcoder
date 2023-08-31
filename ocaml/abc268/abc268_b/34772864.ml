//##// Contest ID: abc268
//##// Problem ID: abc268_b ( https://atcoder.jp/contests/abc268/tasks/abc268_b )
//##// Title: B. Prefix?
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-11 03:01:29 +0000 UTC ( https://atcoder.jp/contests/abc268/submissions/34772864 ) 

open Core
open Printf
open Num
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

let i2f x = Int.to_float x

(************)
let s = ss ()
let t = ss ()

let () =
  ps @@ if String.is_prefix ~prefix:s t then "Yes" else "No"