//##// Contest ID: typical90
//##// Problem ID: typical90_aa ( https://atcoder.jp/contests/typical90/tasks/typical90_aa )
//##// Title: 027. Sign Up Requests （★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-11 14:08:55 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37946609 ) 

open Printf
open Scanf
open IterLabels
open Core
open Num

module Int = struct
  let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

  include Int
end

module Array = struct
  include Array

  let ( .%{} ) arr i =
    try nget arr i
    with _ as e ->
      eprintf "(length=%d, idx=%d)" (length arr) i;
      raise e

  let ( .%{}<- ) = set
end

module M = struct
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

let nn = si ()

let () =
  1 -- nn
  |> fold
       ~init:(Set.empty (module String))
       ~f:(fun registered x ->
         let s = ss () in
         if not @@ Set.mem registered s then (
           pi x;
           Set.add registered s)
         else registered) |> ignore