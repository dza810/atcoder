//##// Contest ID: abc204
//##// Problem ID: abc204_a ( https://atcoder.jp/contests/abc204/tasks/abc204_a )
//##// Title: A. Rock-paper-scissors
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-06 12:27:02 +0000 UTC ( https://atcoder.jp/contests/abc204/submissions/23233964 ) 

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

let get_int () = Scanf.scanf "%d " id
let x = get_int ()
let y = get_int ()

let ans =
  let x, y = if x < y then x, y else y, x in
  (match x, y with
  | 0, 1 -> 2
  | 0, 2 -> 1
  | 1, 2 -> 0
  | x, y when x = y -> x
  | _ -> invalid_arg "")
  |> Int.to_string
;;

let () = ans |> print_endline
