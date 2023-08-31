//##// Contest ID: abc265
//##// Problem ID: abc265_c ( https://atcoder.jp/contests/abc265/tasks/abc265_c )
//##// Title: C. Belt Conveyor
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 06:55:24 +0000 UTC ( https://atcoder.jp/contests/abc265/submissions/34506743 ) 

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
(************)

let hh, ww = si2 ()
let gg = Array.init hh ~f:(fun _ -> Array.init ww ~f:sc)
let visited = Array.init hh ~f:(fun _ -> Array.init ww ~f:(fun _ -> false))

let rec move_u (i, j) = if i <> 1 then i - 1, j else i, j
and move_d (i, j) = if i <> hh then i + 1, j else i, j
and move_l (i, j) = if j <> 1 then i, j - 1 else i, j
and move_r (i, j) = if j <> ww then i, j + 1 else i, j

and move (i, j) =
  if visited.(i - 1).(j - 1)
  then None
  else (
    visited.(i - 1).(j - 1) <- true;
    let ni, nj =
      match gg.(i - 1).(j - 1) with
      | 'U' -> move_u (i, j)
      | 'D' -> move_d (i, j)
      | 'L' -> move_l (i, j)
      | 'R' -> move_r (i, j)
      | _ -> failwith ""
    in
    if ni = i && nj = j then Some (i, j) else move (ni, nj))
;;

let () =
  match move (1, 1) with
  | Some (i, j) -> printf "%d %d\n" i j
  | None -> printf "-1\n"
;;
