//##// Contest ID: abc283
//##// Problem ID: abc283_c ( https://atcoder.jp/contests/abc283/tasks/abc283_c )
//##// Title: C. Cash Register
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-28 07:44:43 +0000 UTC ( https://atcoder.jp/contests/abc283/submissions/38369200 ) 

open Core
open IterLabels

let s = Scanf.scanf " %s" Fn.id

let rec loop ans = function
| '0' :: '0' :: rest -> loop (ans - 1) rest
| _ :: rest -> loop ans rest
| [] -> ans

let () = Printf.printf "%d\n" @@ loop (String.length s) (String.to_list s)

