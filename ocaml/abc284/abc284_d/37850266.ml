//##// Contest ID: abc284
//##// Problem ID: abc284_d ( https://atcoder.jp/contests/abc284/tasks/abc284_d )
//##// Title: D. Happy New Year 2023 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-07 13:49:48 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/37850266 ) 

open Core
open Printf
open Num
open Scanf

let id x = x
let si _ = scanf " %d" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let pi x = printf "%d\n" x

(************)

let tt = si ()
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2
let rec loop nn p = if mod_num nn p =/ zero then p else loop nn (p +/ one)

let () =
  for _ = 1 to tt do
    let nn = sn () in
    let p_or_q = loop nn two in
    let p, q =
      if mod_num nn (square_num p_or_q) =/ zero then
        let p = p_or_q in
        (p, nn // p // p)
      else
        let q = p_or_q in
        let p =
          Num.num_of_int @@ Int.of_float @@ Float.sqrt
          @@ Num.float_of_num (nn // q)
        in
        (p, q)
    in
    let p = Num.string_of_num p in
    let q = Num.string_of_num q in
    printf "%s %s\n" p q
  done