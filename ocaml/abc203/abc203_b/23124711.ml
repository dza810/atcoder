//##// Contest ID: abc203
//##// Problem ID: abc203_b ( https://atcoder.jp/contests/abc203/tasks/abc203_b )
//##// Title: B. AtCoder Condominium
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-02 03:57:37 +0000 UTC ( https://atcoder.jp/contests/abc203/submissions/23124711 ) 

open Core

let int_inf = Int.max_value
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let n = Scanf.scanf "%i " (fun i -> i)
let k = Scanf.scanf "%i " (fun i -> i)

let ans () =
  let aux n = n * (n + 1) / 2 in
  let sum_n = aux n in
  let sum_k = aux k in
  let out = (sum_n * 100 * k) + (n * sum_k) in
  Printf.sprintf "%d" out
;;

let () = ans () |> print_endline
