//##// Contest ID: abc304
//##// Problem ID: abc304_a ( https://atcoder.jp/contests/abc304/tasks/abc304_a )
//##// Title: A. First Player
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-05 11:13:47 +0000 UTC ( https://atcoder.jp/contests/abc304/submissions/42020107 ) 

open Core
open IterLabels


let n = Scanf.scanf " %d" Fn.id

let sa = Array.init n ~f:(fun i -> Scanf.scanf " %s %d" Tuple2.create)

let min_a = sa |> Array.foldi ~init:(-1,Int.max_value_30_bits) ~f:(fun i acc (_,v) -> if v < snd acc then (i, v) else acc) |> fst

let () = (0 -- (n-1)) |> iter ~f:(fun i -> sa.((i+min_a) % n) |> fst |> print_endline)
