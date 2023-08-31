//##// Contest ID: typical90
//##// Problem ID: typical90_j ( https://atcoder.jp/contests/typical90/tasks/typical90_j )
//##// Title: 010. Score Sum Queries（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-10 05:15:04 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37918149 ) 

open Printf
open Num
open Scanf
open IterLabels
open Core

module Int = struct
  let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

  include Int
end

let rec bin_search ~f l r =
  (* `f l` is always true, `f r` is always false *)
  if r - l <= 1 then l
  else
    let c = ((r - l) / 2) + l in
    if f c then bin_search ~f c r else bin_search ~f l c

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let ss _ = scanf " %s" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi ?(list = false) x = if list then eprintf " %d;" x else printf "%d\n" x
let pf ?(list = false) x = if list then eprintf " %f;" x else printf "%f\n" x
let ps ?(list = false) x = if list then eprintf " %s;" x else printf "%s\n" x

let pa ~p l =
  eprintf "[";
  Array.iter l ~f:(fun x -> p ?list:(Some true) x);
  eprintf "]"

let pl ~prefix ~p l =
  eprintf "%s [" prefix;
  List.iter l ~f:(fun x -> p ?list:(Some true) x);
  eprintf "]\n";
  l

let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2

(************)

let nn = si ()

let lr =
  Array.init nn ~f:si2
  |> Array.folding_map ~init:(0, 0) ~f:(fun (accl, accr) (c, p) ->
         let x =
           match c with
           | 1 -> (accl + p, accr)
           | 2 -> (accl, accr + p)
           | _ -> failwith ""
         in
         (x, x))

let () =
  let qq = si () in
  for _ = 1 to qq do
    let l, r = si2 () in
    let l = l - 1 in
    let r = r - 1 in
    let ll = if l = 0 then (0, 0) else lr.(l - 1) in
    let l, r = (fst lr.(r) - fst ll, snd lr.(r) - snd ll) in
    printf "%d %d\n" l r
  done
