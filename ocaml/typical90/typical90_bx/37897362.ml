//##// Contest ID: typical90
//##// Problem ID: typical90_bx ( https://atcoder.jp/contests/typical90/tasks/typical90_bx )
//##// Title: 076. Cake Cut（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 05:41:52 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37897362 ) 

open Core
open Printf
open Num
open Scanf
open IterLabels

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi x = printf "%d\n" x

(************)
let nn = si ()
let aa = Array.init nn ~f:(fun _ -> si ())
let target = Array.fold ~init:0 ~f:( + ) aa
let aa = Array.init (nn * 2) ~f:(fun i -> aa.(i % nn) * 10)

let rec loop l r x =
  (*  *)
  if r >= nn * 2 || l >= nn then false
  else
    match Int.compare target x with
    | 0 -> true
    | 1 -> loop l (r + 1) (x + aa.(r))
    | -1 -> loop (l + 1) r (x - aa.(l))
    | _ -> failwith ""

let () = print_endline (if loop 0 1 aa.(0) then "Yes" else "No")
