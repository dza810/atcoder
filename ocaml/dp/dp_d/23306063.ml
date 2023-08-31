//##// Contest ID: dp
//##// Problem ID: dp_d ( https://atcoder.jp/contests/dp/tasks/dp_d )
//##// Title: D. Knapsack 1
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-09 04:26:03 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23306063 ) 

open Core
open Num

let int_inf = Int.max_value
let id x = x
let get_int () = Scanf.scanf "%d " id
let n = get_int ()
let w = get_int ()

let xs =
  Array.init n ~f:(fun _ ->
      let w = get_int () in
      let v = get_int () |> num_of_int in
      w, v)
;;

let dp = Array.init (n + 1) ~f:(fun _ -> Array.init (w + 1) ~f:(fun _ -> num_of_int 0))

let () =
  for i = 1 to n do
    for j = 1 to w do
      let w, v = xs.(i - 1) in
      dp.(i).(j) <- max_num dp.(i).(j - 1) dp.(i - 1).(j);
      if j >= w then dp.(i).(j) <- max_num dp.(i).(j) (dp.(i - 1).(j - w) +/ v)
    done
  done
;;

let ans = dp.(n).(w) |> string_of_num
let () = ans |> print_endline
