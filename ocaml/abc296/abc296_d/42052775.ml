//##// Contest ID: abc296
//##// Problem ID: abc296_d ( https://atcoder.jp/contests/abc296/tasks/abc296_d )
//##// Title: D. M<=ab
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-07 05:51:40 +0000 UTC ( https://atcoder.jp/contests/abc296/submissions/42052775 ) 

open IterLabels
open Core

let n, m = Scanf.scanf " %d %d" Tuple2.create
let () =
  1 -- n
  |> filter_map ~f:(fun a ->
         let b = (m + a - 1) / a in
         if b < a then Some (-100)
         else if b <= n then (
           Some (a * b))
         else None)
  |> take_while ~f:(fun x -> x > 0)
  |> Iter.min ?lt:None |> Option.value ~default:(-1) |> printf "%d\n"
