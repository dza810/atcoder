//##// Contest ID: abc202
//##// Problem ID: abc202_d ( https://atcoder.jp/contests/abc202/tasks/abc202_d )
//##// Title: D. aab aba baa
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-05 06:05:04 +0000 UTC ( https://atcoder.jp/contests/abc202/submissions/23181124 ) 

open Core
open Num

let int_inf = Int.max_value
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let get_int () = Scanf.scanf "%d " (fun i -> i)
let a = get_int ()
let b = get_int ()
let k = get_int () |> num_of_int
let zero = "a"
let one = "b"
let num_zero = num_of_int 0
let num_one = num_of_int 1

let factorial a =
  let rec aux out a =
    if a =/ num_zero
    then out
    else if a >/ num_zero
    then aux (out */ a) (a -/ num_one)
    else invalid_arg "factorial.aux"
  in
  aux num_one (num_of_int a)
;;

let ans =
  let rec calc out (k : num) a b =
    if a = 0 && b = 0
    then out
    else if a < 0 || b < 0
    then invalid_arg @@ Printf.sprintf "calc(a=%d<0, b=%d<0)" a b
    else if k <=/ num_zero
    then invalid_arg "calc.k <= 0"
    else (
      let all : Num.num = factorial (a + b) // factorial a // factorial b in
      let bound = all */ num_of_int a // num_of_int (a + b) in
      if k <=/ bound
      then calc (out ^ zero) k (a - 1) b
      else calc (out ^ one) (k -/ bound) a (b - 1))
  in
  calc "" k a b
;;

let () = ans |> print_endline
