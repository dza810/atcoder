//##// Contest ID: typical90
//##// Problem ID: typical90_aj ( https://atcoder.jp/contests/typical90/tasks/typical90_aj )
//##// Title: 036. Max Manhattan Distance（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-06 14:04:34 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34658975 ) 

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
let nn = si ()
let qq = si ()

let xy =
  Array.init nn ~f:(fun _ ->
      let x, y = si2 () in
      x - y, x + y)
;;

let xs = xy |> Array.map ~f:fst
let () = Array.sort ~compare:Int.compare xs
let ys = xy |> Array.map ~f:snd
let () = Array.sort ~compare:Int.compare ys
let xmin = xs.(0)
let xmax = xs.(nn - 1)
let ymin = ys.(0)
let ymax = ys.(nn - 1)

let () =
  for _ = 1 to qq do
    let q = si () - 1 in
    let x, y = xy.(q) in
    [ x - xmin; x - xmax; y - ymin; y - ymax ]
    |> List.map ~f:Int.abs
    |> List.fold ~init:0 ~f:Int.max
    |> pi
  done
;;
