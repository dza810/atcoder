//##// Contest ID: typical90
//##// Problem ID: typical90_r ( https://atcoder.jp/contests/typical90/tasks/typical90_r )
//##// Title: 018. Statue of Chokudai（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-24 12:08:40 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32691095 ) 

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
let i2f = Float.of_int
let tt = si () |> i2f
let ll = si () |> i2f
let xx = si () |> i2f
let yy = si () |> i2f
let qq = si ()
let ee = 1 -- qq >>| si

let ans e =
  let e = i2f e in
  let z = ll /. 2. *. (1. -. Float.cos (Float.pi *. 2.0 *.  e /. tt)) in
  let y = -.ll /. 2. *. Float.sin (Float.pi *. 2.0 *. e /. tt) in
  let dr2 = (xx *. xx) +. ((yy -. y) *. (yy -. y)) in
  Float.atan2 z (Float.sqrt dr2) *. 180. /. Float.pi
;;

let () = ee >>| ans >|| pf
