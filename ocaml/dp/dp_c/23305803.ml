//##// Contest ID: dp
//##// Problem ID: dp_c ( https://atcoder.jp/contests/dp/tasks/dp_c )
//##// Title: C. Vacation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-09 03:56:08 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23305803 ) 

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

let xs =
  List.init n ~f:(fun _ ->
      let a = get_int () in
      let b = get_int () in
      let c = get_int () in
      a, b, c)
  |> List.rev
;;

let rec dp (ca, cb, cc) = function
  | [] -> ca |> Int.max cb |> Int.max cc
  | (a, b, c) :: xs ->
    dp
      (Int.max (cb + a) (cc + a), Int.max (ca + b) (cc + b), Int.max (cb + c) (ca + c))
      xs
;;

let ans = dp (0, 0, 0) xs |> Int.to_string
let () = ans |> print_endline
