//##// Contest ID: dp
//##// Problem ID: dp_f ( https://atcoder.jp/contests/dp/tasks/dp_f )
//##// Title: F. LCS
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-09 05:47:34 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23307004 ) 

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

let s = Scanf.scanf "%s\n" id |> String.to_array
let t = Scanf.scanf "%s\n" id |> String.to_array
let ls = Array.length s
let lt = Array.length t
let dp = Array.init (ls + 1) ~f:(fun _ -> Array.init (lt + 1) ~f:(fun _ -> 0))

let () =
  dp.(0).(0) <- 0;
  dp.(0).(1) <- dp.(0).(0);
  dp.(1).(0) <- dp.(0).(0);
  for i = 1 to ls do
    for j = 1 to lt do
      dp.(i).(j) <- Int.max dp.(i).(j) dp.(i).(j - 1);
      dp.(i).(j) <- Int.max dp.(i).(j) dp.(i - 1).(j);
      if Char.(s.(i - 1) = t.(j - 1))
      then dp.(i).(j) <- Int.max dp.(i).(j) (1 + dp.(i - 1).(j - 1));
    done
  done
;;

let mk_string () =
  let rec aux out i j =
    if i = 0 || j = 0
    then out
    else if dp.(i).(j) = dp.(i).(j - 1)
    then aux out i (j - 1)
    else if dp.(i).(j) = dp.(i - 1).(j)
    then aux out (i - 1) j
    else if dp.(i).(j) <> dp.(i - 1).(j - 1)
    then (
      let out = Char.to_string s.(i - 1) ^ out in
      aux out (i - 1) (j - 1))
    else invalid_arg ""
  in
  aux "" ls lt
;;

let ans = mk_string ()
let () = ans |> print_endline
