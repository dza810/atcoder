//##// Contest ID: typical90
//##// Problem ID: typical90_v ( https://atcoder.jp/contests/typical90/tasks/typical90_v )
//##// Title: 022. Cubic Cake（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-11 13:25:24 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37945719 ) 

open Printf
open Scanf
open IterLabels
open Core
open Num

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

let pf ?(list = false) x =
  if list then eprintf " %0.10f;" x else printf "%0.10f\n" x

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

let a = si ()
let b = si ()
let c = si ()

let rec gcd a b =
  if a < b then gcd b a else
  if b = 0 then a else gcd b (a % b)


let () =
    let x = gcd a @@ gcd b c in
    pi @@ (a + b + c) / x - 3