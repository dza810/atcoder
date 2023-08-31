//##// Contest ID: abc202
//##// Problem ID: abc202_a ( https://atcoder.jp/contests/abc202/tasks/abc202_a )
//##// Title: A. Three Dice
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-05 02:13:59 +0000 UTC ( https://atcoder.jp/contests/abc202/submissions/23177598 ) 

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

let a = Scanf.scanf "%d " (fun i -> i)
let b = Scanf.scanf "%d " (fun i -> i)
let c = Scanf.scanf "%d " (fun i -> i)

let ans () =
  7 * 3 - (a + b + c) |> Int.to_string
;;

let () = ans () |> print_endline
;;
