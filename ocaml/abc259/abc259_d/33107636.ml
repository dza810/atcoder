//##// Contest ID: abc259
//##// Problem ID: abc259_d ( https://atcoder.jp/contests/abc259/tasks/abc259_d )
//##// Title: D. Circumferences
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-09 13:06:21 +0000 UTC ( https://atcoder.jp/contests/abc259/submissions/33107636 ) 

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
let sx, sy = si2 ()
let tx, ty = si2 ()
let xyr = 1 -- nn >>| si3 |> Array.of_list

(* Union Find *)
let par = Array.init 40000 ~f:(fun i -> i)

let rec root x =
  if par.(x) = x
  then x
  else (
    par.(x) <- root par.(x);
    par.(x))
;;

let union x y = if root x <> root y then par.(root x) <- root y
let same x y = root x = root y
let len2 (ix, iy) (jx, jy) = ((ix - jx) * (ix - jx)) + ((iy - jy) * (iy - jy))

let () =
  0 -- (nn - 2)
  >|| fun i ->
  i + 1 -- (nn - 1)
  >|| fun j ->
  let ix, iy, ir = xyr.(i) in
  let jx, jy, jr = xyr.(j) in
  let ll = len2 (ix, iy) (jx, jy) in
  if (ir - jr) * (ir - jr) <= ll && ll <= (ir + jr) * (ir + jr) then union i j
;;

let () =
  let s =
    xyr
    |> Array.findi ~f:(fun _ (x, y, r) ->
           ((sx - x) * (sx - x)) + ((sy - y) * (sy - y)) = r * r)
  in
  let t =
    xyr
    |> Array.findi ~f:(fun _ (x, y, r) ->
           ((tx - x) * (tx - x)) + ((ty - y) * (ty - y)) = r * r)
  in
  (match s, t with
  | Some s, Some t -> if same (fst s) (fst t) then "Yes" else "No"
  | _ -> "No")
  |> ps
;;
