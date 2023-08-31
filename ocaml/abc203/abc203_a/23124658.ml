//##// Contest ID: abc203
//##// Problem ID: abc203_a ( https://atcoder.jp/contests/abc203/tasks/abc203_a )
//##// Title: A. Chinchirorin
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-02 03:51:12 +0000 UTC ( https://atcoder.jp/contests/abc203/submissions/23124658 ) 

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

let a, b, c = Scanf.scanf "%d %d %d " (fun a b c -> a, b, c)

let ans () =
  let out = if a = b then c else if a = c then b else if b = c then a else 0 in
  Printf.sprintf "%d" out
;;

let () = ans () |> print_endline
