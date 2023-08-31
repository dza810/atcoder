//##// Contest ID: typical90
//##// Problem ID: typical90_aj ( https://atcoder.jp/contests/typical90/tasks/typical90_aj )
//##// Title: 036. Max Manhattan Distance（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-12 07:01:52 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37956796 ) 

open Printf
open Scanf
open IterLabels
open Core
open Num

module M = struct
  module Int = struct
    let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

    include Int
  end

  let _idx f arr i =
    try f arr i
    with _ as e ->
      eprintf "(length=%d, idx=%d)\n" (Array.length arr) i;
      raise e

  let ( .%{} ) arr i = _idx Array.get arr i
  let ( .%{}<- ) arr i = _idx Array.set arr i
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

  let pa ?(list = false) ?(prefix = "") ~p l =
    eprintf "%s [" prefix;
    Array.iter l ~f:(fun x -> p ?list:(Some true) x);
    eprintf "]\n"

  let pl ?(list = false) ?(prefix = "") ~p l =
    eprintf "%s [" prefix;
    List.iter l ~f:(fun x -> p ?list:(Some true) x);
    eprintf "]\n";
    l

  let rec bin_search ~f l r =
    (* `f l` is always true, `f r` is always false *)
    if r - l <= 1 then l
    else
      let c = ((r - l) / 2) + l in
      if f c then bin_search ~f c r else bin_search ~f l c

  let ( %/ ) x y = mod_num x y
  let i2n = num_of_int
  let zero = num_of_int 0
  let one = num_of_int 1
  let two = num_of_int 2
end

open M

(************)
let nn, qq = si2 ()

let xy =
  Array.init nn ~f:(fun _ ->
      let x, y = si2 () in
      (x - y, x + y))

let max_dist =
  xy
  |> Array.reduce_exn ~f:(fun (xx, yy) (x, y) -> (Int.max xx x, Int.max yy y))

let min_dist =
  xy
  |> Array.reduce_exn ~f:(fun (xx, yy) (x, y) -> (Int.min xx x, Int.min yy y))

let dist (x, y) =
  let xx, yy = max_dist in
  let d = Int.max (Int.abs @@ (xx - x)) (Int.abs @@ (yy - y)) in
  let xx, yy = min_dist in
  Int.max d @@ Int.max (Int.abs @@ (xx - x)) (Int.abs @@ (yy - y))

let () =
  for _ = 1 to qq do
    let q = si () - 1 in
    pi @@ dist xy.(q)
  done