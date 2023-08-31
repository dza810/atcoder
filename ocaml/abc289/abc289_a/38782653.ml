//##// Contest ID: abc289
//##// Problem ID: abc289_a ( https://atcoder.jp/contests/abc289/tasks/abc289_a )
//##// Title: A. flip
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-11 12:02:17 +0000 UTC ( https://atcoder.jp/contests/abc289/submissions/38782653 ) 

open Core
open IterLabels

let () =
  Scanf.scanf " %s" Fn.id
  |> String.map ~f:(function '0' -> '1' | '1' -> '0' | c -> c)
  |> Printf.printf "%s\n"
