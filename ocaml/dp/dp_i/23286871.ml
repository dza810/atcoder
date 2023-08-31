//##// Contest ID: dp
//##// Problem ID: dp_i ( https://atcoder.jp/contests/dp/tasks/dp_i )
//##// Title: I. Coins
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-08 02:02:18 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23286871 ) 

open Core

let int_inf = Int.max_value
let id x = x
let get_int () = Scanf.scanf "%d " id
let get_float () = Scanf.scanf "%f " id
let n = get_int ()
let xs = Array.init n ~f:(fun _ -> get_float ())
let dp = Array.init (n + 1) ~f:(fun _ -> Array.init (n + 1) ~f:(fun _ -> 0.0))
let () = Array.iter xs ~f:(fun x -> Printf.eprintf "%0.2f\n" x)

let () =
  dp.(0).(0) <- 1.0;
  dp.(0).(1) <- 0.0;
  for i = 0 to n - 1 do
    for j = 0 to n - 1 do
      if i >= j
      then (
        dp.(i + 1).(j) <- dp.(i + 1).(j) +. (dp.(i).(j) *. xs.(i));
        dp.(i + 1).(j + 1) <- dp.(i + 1).(j + 1) +. (dp.(i).(j) *. (1. -. xs.(i))))
    done
  done
;;

let ans =
  let f j = dp.(n).(j) in
  List.init ((n / 2) + 1) ~f |> List.fold ~init:0.0 ~f:( +. ) |> Float.to_string
;;

let () = ans |> print_endline
