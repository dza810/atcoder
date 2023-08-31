//##// Contest ID: typical90
//##// Problem ID: typical90_a ( https://atcoder.jp/contests/typical90/tasks/typical90_a )
//##// Title: 001. Yokan Party（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 12:55:29 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37906724 ) 

open Core
open Printf
open Num
open Scanf
open IterLabels

module Int = struct
  let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

  include Int
end

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let ss _ = scanf " %c" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi ?(list = false) x = if list then printf " %d;" x else printf "%d\n" x
let ps ?(list = false) x = if list then printf " %s;" x else printf "%s\n" x

let pa ~p l =
  printf "[";
  Array.iter l ~f:(fun x -> p ?list:(Some true) x);
  print_endline "]"

let pl ~p l =
  printf "[";
  List.iter l ~f:(fun x -> p ?list:(Some true) x);
  print_endline "]"

let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2
(************)

let rec bin_search ~f l r =
  if r - l <= 1 then l
  else
    let c = ((r - l) / 2) + l in
    if f c then bin_search ~f l c else bin_search ~f c r

let nn, ll = si2 ()
let kk = si ()
let aa = Array.init nn ~f:si

let f c =
  let rec aux ~cnt ~last ~i =
    if i >= nn then kk > cnt
    else if aa.(i) - last >= c && ll - aa.(i) >= c then
      aux ~cnt:(cnt + 1) ~last:aa.(i) ~i:(i + 1)
    else aux ~cnt ~last ~i:(i + 1)
  in
  aux ~cnt:0 ~last:0 ~i:0

let () = bin_search ~f 0 ll |> pi
