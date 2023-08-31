//##// Contest ID: abc309
//##// Problem ID: abc309_a ( https://atcoder.jp/contests/abc309/tasks/abc309_a )
//##// Title: A. Nine
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-08 12:07:37 +0000 UTC ( https://atcoder.jp/contests/abc309/submissions/43345600 ) 

open IterLabels
open Core

let a, b = Scanf.scanf " %d %d" Tuple2.create

let () =
  let a, b = (a - 1, b - 1) in
  let flg = a / 3 = b / 3 && (a % 3) + 1 = b % 3 in
  print_endline @@ if flg then "Yes" else "No"
