//##// Contest ID: abc189
//##// Problem ID: abc189_b ( https://atcoder.jp/contests/abc189/tasks/abc189_b )
//##// Title: B. Alcoholic
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-01-27 01:23:35 +0000 UTC ( https://atcoder.jp/contests/abc189/submissions/19715404 ) 

open Core

let int_inf = 10000000000
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let n = Scanf.scanf "%d " id
let x = 100 * Scanf.scanf "%d " id
let xs = repeat ~f:(fun () -> Scanf.scanf "%d %d " (fun vi pi -> vi, pi)) [] n

(* List.fold_left ~f:(fun acc x -> acc + (x * x)) ~init:0 abs_xs *)

let ans =
  let loop (flg, acc, num) (v, p) =
    if flg
    then (
      let acc = acc + (v * p) in
      x >= acc, acc, num + 1)
    else flg, acc, num
  in
  let flg, _, num = List.fold_left ~init:(true, 0, 0) ~f:loop xs in
  Printf.sprintf "%d" (if flg then -1 else num)
;;

let () = print_endline ans
