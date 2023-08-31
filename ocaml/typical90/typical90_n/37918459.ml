//##// Contest ID: typical90
//##// Problem ID: typical90_n ( https://atcoder.jp/contests/typical90/tasks/typical90_n )
//##// Title: 014. We Used to Sing a Song Together（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-10 05:35:37 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37918459 ) 

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
let aa = Array.init nn ~f:si
let () = Array.sort ~compare:Int.compare aa
let bb = Array.init nn ~f:si
let () = Array.sort ~compare:Int.compare bb

let () =
  Array.map2_exn aa bb ~f:(fun a b -> Int.abs (a - b))
  |> Array.fold ~init:0 ~f:( + )
  |> pi
