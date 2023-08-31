//##// Contest ID: abc200
//##// Problem ID: abc200_b ( https://atcoder.jp/contests/abc200/tasks/abc200_b )
//##// Title: B. 200th ABC-200
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-06 01:52:57 +0000 UTC ( https://atcoder.jp/contests/abc200/submissions/23197680 ) 

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

let n = get_int ()
let k = get_int ()

let ans =
  let rec loop k n =
    if k = 0 then n else
    if n mod 200 = 0 then loop (k-1) (n/200) else
    loop (k - 1) (n * 1000 + 200)
  in
  loop k n |> Int.to_string
;;

let () = ans |> print_endline
;;
