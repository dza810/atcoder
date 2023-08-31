//##// Contest ID: abc255
//##// Problem ID: abc255_b ( https://atcoder.jp/contests/abc255/tasks/abc255_b )
//##// Title: B. Light It Up
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-22 13:45:30 +0000 UTC ( https://atcoder.jp/contests/abc255/submissions/32661175 ) 

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
let pf f = printf "%0.12f\n" f

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

let i2f = Float.of_int

(************)
let nn, kk = si2 ()
let flg = Array.init nn ~f:(fun _ -> false)

let aa =
  1 -- kk
  >>| fun _ ->
  let x = si () in
  flg.(x - 1) <- true
;;

let xy = 1 -- nn >>| si2
let on = xy |> filteri ~f:(fun i _ -> flg.(i))
let off = xy |> filteri ~f:(fun i _ -> not flg.(i))

let dist a b =
  let dx = fst a - fst b in
  let dy = snd a - snd b in
  (dx * dx) + (dy * dy)
;;

let () =
  off
  >>| (fun off -> on >>| (fun on -> dist off on) |> fold ~init:Int.max_value ~f:Int.min)
  |> fold ~init:0 ~f:Int.max
  |> i2f
  |> Float.sqrt
  |> pf
;;
