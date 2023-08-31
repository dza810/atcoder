//##// Contest ID: abc315
//##// Problem ID: abc315_a ( https://atcoder.jp/contests/abc315/tasks/abc315_a )
//##// Title: A. tcdr
//##// Language: OCaml (ocamlopt 5.0.0)
//##// Submitted: 2023-08-21 13:40:04 +0000 UTC ( https://atcoder.jp/contests/abc315/submissions/44827575 ) 

open Core

let () =
  Scanf.scanf " %s" Fn.id
  |> String.filter ~f:(function
       | 'a' | 'e' | 'i' | 'o' | 'u' -> false
       | _ -> true)
  |> print_endline
