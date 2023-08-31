//##// Contest ID: abc202
//##// Problem ID: abc202_b ( https://atcoder.jp/contests/abc202/tasks/abc202_b )
//##// Title: B. 180°
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-05 02:36:24 +0000 UTC ( https://atcoder.jp/contests/abc202/submissions/23177927 ) 

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

let s = Scanf.scanf "%s " (fun i -> i) |> String.to_list

let ans () =
  let rec loop out = function
    | [] -> out
    | x :: xs ->
      let nx =
        match x with
        | '0'
        | '1'
        | '8' ->
          x
        | '6' -> '9'
        | '9' -> '6'
        | _ -> invalid_arg "loop"
      in
      loop (nx :: out) xs
  in
  loop [] s |> String.of_char_list
;;

let () = ans () |> print_endline
