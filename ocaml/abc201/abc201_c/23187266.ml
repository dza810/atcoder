//##// Contest ID: abc201
//##// Problem ID: abc201_c ( https://atcoder.jp/contests/abc201/tasks/abc201_c )
//##// Title: C. Secret Number
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-05 11:28:23 +0000 UTC ( https://atcoder.jp/contests/abc201/submissions/23187266 ) 

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
let get_string () = Scanf.scanf "%s " id
let s = get_string () |> String.to_list

let a, b, c =
  let rec count a b c = function
    | [] -> a, b, c
    | 'o' :: ss -> count (a + 1) b c ss
    | 'x' :: ss -> count a (b + 1) c ss
    | '?' :: ss -> count a b (c + 1) ss
    | _ -> invalid_arg "count"
  in
  count 0 0 0 s
;;

let ans =
  let f = function
    | 1 -> 1
    | 2 -> 14
    | 3 -> 36
    | 4 -> 24
    | _ -> invalid_arg "f"
  in
  let out =
    if a = 0
    then Int.pow (10 - b) 4
    else if a > 4
    then 0
    else if b = 10
    then 0
    else if a = 1
    then (
      let a = f 1 in
      let a = a + if c > 0 then f 2 * c else 0 in
      let a = a + if c > 1 then f 3 * c * (c - 1) / 2 else 0 in
      let a = a + if c > 2 then f 4 * c * (c - 1) * (c - 2) / 3 / 2 else 0 in
      a)
    else if a = 2
    then (
      let a = f 2 in
      let a = a + if c > 0 then f 3 * c else 0 in
      let a = a + if c > 1 then f 4 * c * (c - 1) / 2 else 0 in
      a)
    else if a = 3
    then (
      let a = f 3 in
      let a = a + if c > 0 then f 4 * c else 0 in
      a)
    else if a = 4
    then (
      let a = f 4 in
      a)
    else invalid_arg "out"
  in
  out |> Int.to_string
;;

let () = ans |> print_endline
