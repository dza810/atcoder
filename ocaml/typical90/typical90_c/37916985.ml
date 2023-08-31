//##// Contest ID: typical90
//##// Problem ID: typical90_c ( https://atcoder.jp/contests/typical90/tasks/typical90_c )
//##// Title: 003. Longest Circular Road（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-10 03:51:38 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37916985 ) 

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
let ss _ = scanf " %c" id
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
  eprintf "]\n"; l

let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2

(************)

let nn = si ()

let ab =
  let ab = Hashtbl.create (module Int) in
  1 -- (nn - 1)
  |> iter ~f:(fun _ ->
         let a, b = si2 () in
         Hashtbl.add_multi ab ~key:a ~data:b;
         Hashtbl.add_multi ab ~key:b ~data:a);
  ab

let rec dfs depth visited p =
  let visited = Set.add visited p in
  Hashtbl.find_multi ab p
  |> List.filter ~f:(fun pp -> not @@ Set.mem visited pp)
  |> List.map ~f:(fun pp -> dfs (depth + 1) visited pp)
  |> List.fold ~init:(p, depth) ~f:(fun x y -> if snd x > snd y then x else y)

let () =
  let a, _ = dfs 0 (Set.empty(module Int)) 1 in
  let _, d = dfs 0 (Set.empty(module Int)) a in
  pi @@ d + 1
