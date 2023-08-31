//##// Contest ID: abc309
//##// Problem ID: abc309_c ( https://atcoder.jp/contests/abc309/tasks/abc309_c )
//##// Title: C. Medicine
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-08 13:10:27 +0000 UTC ( https://atcoder.jp/contests/abc309/submissions/43378843 ) 

open IterLabels
open Core

let n, k = Scanf.scanf " %d %d" Tuple2.create

let ab =
  1 -- n
  |> fold
       ~init:(Map.empty (module Int))
       ~f:(fun mp _ ->
         let a, b = Scanf.scanf " %d %d" Tuple2.create in
         Map.update mp a ~f:(function None -> b | Some x -> b + x))
  |> Map.to_alist ~key_order:`Decreasing
  |> List.folding_map ~init:0 ~f:(fun acc (a, b) -> (acc + b, (a, acc + b)))
  |> Array.of_list

let () =
  Array.binary_search ab
    ~compare:(fun (_, v) key -> Int.compare v key)
    `First_strictly_greater_than k
  |> Option.map ~f:(fun i -> 1 + fst ab.(i))
  |> Option.value ~default:1
  |> Printf.printf "%d\n"
