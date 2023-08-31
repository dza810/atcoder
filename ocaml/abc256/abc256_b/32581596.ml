//##// Contest ID: abc256
//##// Problem ID: abc256_b ( https://atcoder.jp/contests/abc256/tasks/abc256_b )
//##// Title: B. Batters
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-19 02:08:45 +0000 UTC ( https://atcoder.jp/contests/abc256/submissions/32581596 ) 

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
let nn = si ()

let aa = (1 -- nn) >>| si

let () =
  let calc (koma, p) a =
    let koma = 0 :: koma in
    let koma = koma >>| ( (+) a ) in
    let pp = koma |> filter ~f:(fun x -> x >= 4) |> length in
    let p = p + pp in
    let koma = koma |> filter ~f:(fun x -> x < 4) in
    (koma, p)
  in
  aa |> fold ~init:([], 0) ~f:calc |> snd |> pi

