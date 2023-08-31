//##// Contest ID: abc288
//##// Problem ID: abc288_a ( https://atcoder.jp/contests/abc288/tasks/abc288_a )
//##// Title: A. Many A+B Problems
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-04 12:06:22 +0000 UTC ( https://atcoder.jp/contests/abc288/submissions/38605438 ) 

open Core

let n = Scanf.scanf " %d" Fn.id

let () =
  for _ = 1 to n do
    let a, b = Scanf.scanf " %d %d" Tuple2.create in
    Printf.printf "%d\n" (a + b)
  done
;;
