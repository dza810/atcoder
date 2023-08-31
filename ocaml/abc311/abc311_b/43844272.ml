//##// Contest ID: abc311
//##// Problem ID: abc311_b ( https://atcoder.jp/contests/abc311/tasks/abc311_b )
//##// Title: B. Vacation Together
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-22 12:19:06 +0000 UTC ( https://atcoder.jp/contests/abc311/submissions/43844272 ) 

open IterLabels
open Core

let n, d = Scanf.scanf " %d %d" Tuple2.create
let all_free = Array.init n ~f:(Fn.const true)

let s =
  1 -- n
  |> fold
       ~f:(fun acc _ ->
         Array.map acc ~f:(fun f -> Char.('o' = Scanf.scanf " %c" Fn.id) && f))
       ~init:(Array.init d ~f:(Fn.const true))

let () =
  s
  |> Array.folding_map ~init:0 ~f:(fun acc f ->
         let v = if f then acc + 1 else 0 in
         (v, v))
  |> of_array |> Iter.max_exn ?lt:None |> Printf.printf "%d\n"
