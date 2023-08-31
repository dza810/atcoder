//##// Contest ID: typical90
//##// Problem ID: typical90_f ( https://atcoder.jp/contests/typical90/tasks/typical90_f )
//##// Title: 006. Smallest Subsequence（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-10 04:23:14 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37917391 ) 

open Printf
open Num
open Scanf
open IterLabels
open Core

module Int = struct
  let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

  include Int
end

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

let nn, kk = si2 ()
let str = ss () |> String.to_array

let rec find_min (p, v) l r =
  if l = r then (p, v) else 
  let x = if Char.(str.(l) < v) then (l, str.(l)) else (p, v) in
  find_min x (l + 1) r

let () =
  (1 -- kk) |> fold ~init:0 ~f:(fun l i ->
    let p,v = find_min (l, str.(l)) l (nn - kk + i) in
    printf "%c" v;
    (p + 1)
    ) |> ignore