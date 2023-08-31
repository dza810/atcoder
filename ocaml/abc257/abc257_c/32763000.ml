//##// Contest ID: abc257
//##// Problem ID: abc257_c ( https://atcoder.jp/contests/abc257/tasks/abc257_c )
//##// Title: C. Robot Takahashi 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-26 03:33:40 +0000 UTC ( https://atcoder.jp/contests/abc257/submissions/32763000 ) 

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
let ss = 1 -- nn >>| sc
let ww = 1 -- nn >>| si

let sw =
  zip_exn ss ww
  |> List.sort ~compare:(fun (s1, w1) (s2, w2) ->
         (100 * Int.compare w1 w2) + Char.compare s1 s2)
;;

let () =
  let pl = ss |> filter ~f:Char.(( = ) '1') |> length in
  let ans =
    sw
    |> fold_map ~init:pl ~f:(fun prev (s, w) ->
           let x = if Char.(s = '0') then prev + 1 else prev - 1 in
           x, (x, w))
    |> snd
  in
  let ans = (pl, 0) :: ans in 
  let ans =
    ans
    |> rev
    |> fold_map ~init:(0, 0) ~f:(fun (prevv, prevw) (v, w) ->
      let x =
           let v = if prevw = w then prevv else Int.max v prevv in
           v, w
      in (x, x))
  in
  fst @@ fst ans |> pi
;;
