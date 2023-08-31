//##// Contest ID: abc204
//##// Problem ID: abc204_b ( https://atcoder.jp/contests/abc204/tasks/abc204_b )
//##// Title: B. Nuts
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-06 12:31:03 +0000 UTC ( https://atcoder.jp/contests/abc204/submissions/23235319 ) 

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
let an = repeat ~f:(fun () -> get_int ()) [] n

let ans =
  let rec aux out = function
    | [] -> out
    | x :: xs ->
      let out = out + if x > 10 then x - 10 else 0 in
      aux out xs
  in
  aux 0 an |> Int.to_string
;;

let () = ans |> print_endline
