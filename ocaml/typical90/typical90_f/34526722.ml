//##// Contest ID: typical90
//##// Problem ID: typical90_f ( https://atcoder.jp/contests/typical90/tasks/typical90_f )
//##// Title: 006. Smallest Subsequence（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 08:28:55 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34526722 ) 

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
let nn, kk = si2 ()
let ss = ss () |> String.to_list |> Array.of_list

let find s e =
  let i, v =
    Array.sub ss ~pos:s ~len:(e - s)
    |> Array.foldi ~init:(0, '{') ~f:(fun i (acci, accv) x ->
           if Char.(x < accv) then i, x else acci, accv)
  in
  i + s, v
;;

let () =
  let _, v =
    1 -- kk
    |> fold ~init:(0, []) ~f:(fun (acci, accv) x ->
           let i, v = find acci (nn - kk + x) in
           i + 1, (v :: accv))
  in
  ps @@ String.of_char_list (List.rev v)
;;
