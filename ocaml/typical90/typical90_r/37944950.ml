//##// Contest ID: typical90
//##// Problem ID: typical90_r ( https://atcoder.jp/contests/typical90/tasks/typical90_r )
//##// Title: 018. Statue of Chokudai（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-11 12:45:52 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37944950 ) 

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
let pf ?(list = false) x = if list then eprintf " %0.10f;" x else printf "%0.10f\n" x
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

let tt = Float.of_int @@ si ()
let ll = Float.of_int @@ si ()
let xx = Float.of_int @@ si ()
let yy = Float.of_int @@ si ()
let zz = 0.
let qq = si ()

let calc e =
  let d = 2. *. Float.pi *. e /. tt in
  let x = 0. in
  let y = -. ll /. 2. *. Float.sin d in
  let z = ll/.2. -.  ll/.2. *. Float.cos d in
  let dx = xx -. x in
  let dy = yy -. y in
  let dz = zz -. z in
  let r = Float.sqrt (dx *. dx +. dy *. dy) in
  Float.abs @@ (Float.atan2 dz r) *. 180. /. Float.pi 

let () =
  for _ = 1 to qq do
    let e = Float.of_int @@ si () in
    pf @@ calc e
  done
