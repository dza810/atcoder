//##// Contest ID: typical90
//##// Problem ID: typical90_l ( https://atcoder.jp/contests/typical90/tasks/typical90_l )
//##// Title: 012. Red Painting（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 11:11:19 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34529782 ) 

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

let i2f x = Int.to_float x

(************)
let hh, ww = si2 ()
let red = Array.make_matrix ~dimx:(hh + 2) ~dimy:(ww + 2) false
let is_red p = red.(fst p).(snd p)
let qq = si ()
let arr = Array.init ((hh + 2) * (ww + 2)) ~f:(fun i -> i)

let rec par x =
  if arr.(x) <> x then arr.(x) <- par arr.(x);
  arr.(x)
;;

let con x y =
  let x = (fst x * (ww + 2)) + snd x in
  let y = (fst y * (ww + 2)) + snd y in
  arr.(par x) <- par y
;;

let is_con x y =
  let x = (fst x * (ww + 2)) + snd x in
  let y = (fst y * (ww + 2)) + snd y in
  par x = par y
;;

let () =
  for _ = 1 to qq do
    let t = si () in
    if t = 1
    then (
      let r, c = si2 () in
      red.(r).(c) <- true;
      let v = r + 1, c in
      if is_red v then con v (r, c);
      let v = r - 1, c in
      if is_red v then con v (r, c);
      let v = r, c + 1 in
      if is_red v then con v (r, c);
      let v = r, c - 1 in
      if is_red v then con v (r, c);
      ())
    else (
      let pa = si2 () in
      let pb = si2 () in
      ps @@ if is_red pa && is_red pb && is_con pa pb then "Yes" else "No")
  done
;;
