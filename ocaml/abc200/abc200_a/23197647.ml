//##// Contest ID: abc200
//##// Problem ID: abc200_a ( https://atcoder.jp/contests/abc200/tasks/abc200_a )
//##// Title: A. Century
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-06 01:49:58 +0000 UTC ( https://atcoder.jp/contests/abc200/submissions/23197647 ) 

open Core

let id x = x

let get_int () = Scanf.scanf "%d " id

let n = get_int ()

let ans =
  ((n - 1) / 100) + 1 |> Int.to_string
;;

let () = ans |> print_endline
;;
