//##// Contest ID: typical90
//##// Problem ID: typical90_l ( https://atcoder.jp/contests/typical90/tasks/typical90_l )
//##// Title: 012. Red Painting（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-21 13:42:54 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32644664 ) 

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
let hh, ww = si2 ()
let red = Array.init (2002 * 2002) ~f:(fun _ -> false)
let par = Array.init (2002 * 2002) ~f:(fun i -> i)
let qq = si ()
let p (r, c) = (r * 2002) + c

let rec root x =
  if par.(x) = x
  then x
  else (
    par.(x) <- root par.(x);
    par.(x))
;;

let union x y = if root x <> root y then par.(root x) <- root y
let same x y = root x = root y

let query _ =
  let t = si () in
  if t = 1
  then (
    let r, c = si2 () in
    red.(p (r, c)) <- true;
    let aux dr dc =
      if red.(p (r + dr, c + dc)) then union (p (r + dr, c + dc)) (p (r, c))
    in
    aux 1 0;
    aux 0 1;
    aux (-1) 0;
    aux 0 (-1))
  else (
    let a = si2 () in
    let b = si2 () in
    if red.(p a) && red.(p b) && same (p a) (p b) then ps "Yes" else ps "No")
;;

let () =
  1 -- qq |> iter ~f:query