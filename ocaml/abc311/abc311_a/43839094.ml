//##// Contest ID: abc311
//##// Problem ID: abc311_a ( https://atcoder.jp/contests/abc311/tasks/abc311_a )
//##// Title: A. First ABC
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-22 12:11:24 +0000 UTC ( https://atcoder.jp/contests/abc311/submissions/43839094 ) 

open IterLabels
open Core

let n = Scanf.scanf " %d" Fn.id
let s = Scanf.scanf " %s" Fn.id |> String.to_array

let () =
  [ 'A'; 'B'; 'C' ]
  |> List.map ~f:(fun c ->
         fst @@ Array.findi_exn s ~f:(fun _ x -> Char.( = ) x c))
  |> List.fold ~init:0 ~f:Int.max
  |> ( + ) 1 |> Printf.printf "%d\n"
