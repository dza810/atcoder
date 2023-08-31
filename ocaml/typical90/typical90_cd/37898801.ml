//##// Contest ID: typical90
//##// Problem ID: typical90_cd ( https://atcoder.jp/contests/typical90/tasks/typical90_cd )
//##// Title: 082. Counting Numbers（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 06:51:37 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37898801 ) 

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
let ( %/ ) x y = mod_num x y
let mm x = x %/ num_of_int 1_000_000_007

(* let vvv =
  let rec aux v x i =
    if i =/ num_of_int 1 then mm (v */ x)
    else if i %/ num_of_int 2 =/ num_of_int 0 then
      aux v (mm @@ (x */ x)) (Num.floor_num @@ (i // num_of_int 2))
    else
      aux
        (mm @@ (v */ x))
        (mm @@ (x */ x))
        (Num.floor_num @@ (i // num_of_int 2))
  in
  aux (num_of_int 1) (num_of_int 2) (num_of_int 1_000_000_005)

let () = eprintf "vvv=%s" @@ string_of_num vvv *)

let vvv = num_of_int 500000004
let ll = sn ()
let rr = sn ()
let ll_log10 = (String.length @@ string_of_num ll) - 1
let rr_log10 = (String.length @@ string_of_num rr) - 1
let () = eprintf "%d, %d"  ll_log10 rr_log10
let () =
  ll_log10 -- rr_log10
  |> map ~f:(fun (d : int) ->
         let d = num_of_int d in
         let l = mm @@ max_num ll (power_num (num_of_int 10) d) in
         let r =
           mm @@ min_num rr (power_num (num_of_int 10) (d +/ num_of_int 1) -/ num_of_int 1)
         in
         let l = mm ((r +/ l) */ mm (r -/ l +/ num_of_int 1) */ vvv) in
         mm ((d +/ num_of_int 1) */ l))
  |> fold ~init:(num_of_int 0) ~f:(fun acc x -> mm (acc +/ x))
  |> string_of_num |> print_endline