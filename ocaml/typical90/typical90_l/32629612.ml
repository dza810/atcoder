//##// Contest ID: typical90
//##// Problem ID: typical90_l ( https://atcoder.jp/contests/typical90/tasks/typical90_l )
//##// Title: 012. Red Painting（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-20 15:10:38 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32629612 ) 

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
let hw = Array.init (2002 * 2002) ~f:(fun _ -> false)
let par = Array.init (2002 * 2002) ~f:(fun i -> i)

let rec root x =
  if x = par.(x)
  then x
  else (
    par.(x) <- root par.(x);
    par.(x))
;;

let union x y = if root x <> root y then par.(root y) <- root x
let same x y = root x = root y
let p h w = (h * 2002) + w
let qq = si ()

let t1 () =
  let r, c = si2 () in
  let pp = p r c in
  hw.(pp) <- true;
  if hw.(p (r + 1) c) then union pp @@ p (r + 1) c;
  if hw.(p (r - 1) c) then union pp @@ p (r - 1) c;
  if hw.(p r (c + 1)) then union pp @@ p r (c + 1);
  if hw.(p r (c - 1)) then union pp @@ p r (c - 1)
;;

let t2 () =
  let ra, ca = si2 () in
  let pa = p ra ca in
  let rb, cb = si2 () in
  let pb = p rb cb in
  ps @@ if hw.(pa) && hw.(pb) && same pa pb then "Yes" else "No"
;;

let query _ =
  let t = si () in
  if t = 1 then t1 () else t2 ()
;;

let () = 1 -- qq |> iter ~f:query
