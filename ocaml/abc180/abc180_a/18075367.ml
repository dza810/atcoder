//##// Contest ID: abc180
//##// Problem ID: abc180_a ( https://atcoder.jp/contests/abc180/tasks/abc180_a )
//##// Title: A. box
//##// Language: OCaml (4.10.0)
//##// Submitted: 2020-11-13 07:39:01 +0000 UTC ( https://atcoder.jp/contests/abc180/submissions/18075367 ) 

open Batteries

let n, a, b = Scanf.scanf "%d %d %d" (fun a b c-> (a,b,c))

let ans = Printf.sprintf "%d" ( n - a + b)
let () = print_endline ans
