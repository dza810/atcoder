//##// Contest ID: abc277
//##// Problem ID: abc277_d ( https://atcoder.jp/contests/abc277/tasks/abc277_d )
//##// Title: D. Takahashi's Solitaire
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-03 06:36:00 +0000 UTC ( https://atcoder.jp/contests/abc277/submissions/38565617 ) 

open IterLabels
open Core
module ISet = Set.Make (Int)

let n, m = Scanf.scanf " %d %d" Tuple2.create
let a = 1 -- n |> map ~f:(fun _ -> Scanf.scanf " %d" Fn.id) |> count |> sort |> persistent
let cnt_sum = a |> map ~f:(fun (v, c) -> v * c) |> sum
let a = append a a

let () =
let _, ans, sum =
  a
  |> fold ~init:(-1, 0, 0) ~f:(fun (prev, ans, sum) (v, c) ->
       if v = (prev + 1) % m then v, ans, sum + (v * c) else v, Int.max ans sum, v * c)
  in
  Int.max ans sum
  |> fun x -> cnt_sum - x  |> Int.max 0 |> Printf.printf "%d\n"
;;
