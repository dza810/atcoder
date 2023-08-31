//##// Contest ID: abc180
//##// Problem ID: abc180_b ( https://atcoder.jp/contests/abc180/tasks/abc180_b )
//##// Title: B. Various distances
//##// Language: OCaml (4.10.0)
//##// Submitted: 2020-11-13 08:23:08 +0000 UTC ( https://atcoder.jp/contests/abc180/submissions/18076045 ) 

open Batteries

let int_inf = 10000000000
let id x = x

let repeat f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let power =
  let rec aux out x = function
    | 0 -> out
    | n -> if n mod 2 = 0 then aux out (x * x) (n / 2) else aux (out * x) x (n - 1)
  in
  aux 1
;;

let n = read_int ()
let xs = repeat (fun () -> Scanf.scanf "%d " id) [] n
let abs (x : int) = if x < 0 then -x else x

let ans =
  let abs_xs = List.map abs xs in
  let a = List.fold_left ( + ) 0 abs_xs in
  let b =
    List.fold_left (fun acc x -> acc + (x * x)) 0 abs_xs
    |> float_of_int
    |> sqrt
  in
  let c = List.fold_left max 0 abs_xs in
  Printf.sprintf "%d\n%0.15f\n%d" a b c
;;

let () = print_endline ans
