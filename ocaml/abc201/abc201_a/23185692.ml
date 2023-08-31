//##// Contest ID: abc201
//##// Problem ID: abc201_a ( https://atcoder.jp/contests/abc201/tasks/abc201_a )
//##// Title: A. Tiny Arithmetic Sequence
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-05 10:04:00 +0000 UTC ( https://atcoder.jp/contests/abc201/submissions/23185692 ) 

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

let get_int () = Scanf.scanf "%d " (fun i -> i)
let a = repeat ~f:get_int [] 3 |> List.sort ~compare:(Int.compare)

let ans =
  let flg = match a with
  | [a;b;c] ->  a - b = b - c
  | _ -> invalid_arg "ans"
  in
  if flg then "Yes" else "No"
;;

let () = ans |> print_endline
;;
