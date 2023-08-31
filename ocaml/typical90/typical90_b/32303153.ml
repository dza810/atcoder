//##// Contest ID: typical90
//##// Problem ID: typical90_b ( https://atcoder.jp/contests/typical90/tasks/typical90_b )
//##// Title: 002. Encyclopedia of Parentheses（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-07 09:23:40 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32303153 ) 

open Core
open Printf
open Scanf
open Num

let inf = Int.max_value
let id x = x
let nn = Scanf.scanf "%d " id
;;

let rec make str left right = 
  let () = if left < nn / 2 then make (str ^ "(") (left + 1) right in
  let () = if right < left then make (str ^ ")") left (right + 1) in
  let () = if right + left = nn then printf "%s\n" str in
  ()
  ;;
  
let () =
  if nn mod 2 = 1 then print_endline "" else
  make "" 0 0
;;
