//##// Contest ID: abc259
//##// Problem ID: abc259_d ( https://atcoder.jp/contests/abc259/tasks/abc259_d )
//##// Title: D. Circumferences
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-10 07:57:59 +0000 UTC ( https://atcoder.jp/contests/abc259/submissions/33143450 ) 

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
let s = si2 ()
let t = si2 ()
let xyr = Array.init nn ~f:si3

(* Union find *)
let size = 3_100
let par = Array.init size ~f:id

let rec root x =
  (* root root x = root x *)
  let () = if par.(x) <> x then par.(x) <- root par.(x) in
  par.(x)
;;

let union x y =
  let x = root x in
  let y = root y in
  par.(x) <- y
;;

let same x y = root x = root y

let is_connected (ax, ay, ar) (bx, by, br) =
  let dx, dy = ax - bx, ay - by in
  let len2 = (dx * dx) + (dy * dy) in
  (ar - br) * (ar - br) <= len2 && len2 <= (ar + br) * (ar + br)
;;

let find_n (x, y) =
  xyr
  |> Array.findi ~f:(fun _ (a, b, r) -> ((x - a) * (x - a)) + ((y - b) * (y - b)) = r * r)
;;

let () =
  for i = 0 to nn - 2 do
    for j = 1 to nn - 1 do
      if is_connected xyr.(i) xyr.(j) then union i j
    done
  done
;;

let () =
  match find_n s, find_n t with
  | Some (s, _), Some (t, _) -> ps @@ if same s t then "Yes" else "No"
  | _ -> ps "No"
;;
