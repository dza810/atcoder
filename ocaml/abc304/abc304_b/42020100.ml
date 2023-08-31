//##// Contest ID: abc304
//##// Problem ID: abc304_b ( https://atcoder.jp/contests/abc304/tasks/abc304_b )
//##// Title: B. Subscribers
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-05 11:13:24 +0000 UTC ( https://atcoder.jp/contests/abc304/submissions/42020100 ) 

open Core
open IterLabels

let n = Scanf.scanf " %s" Fn.id
let () = String.mapi n ~f:(fun i x -> if i > 2 then '0' else x) |> print_endline
