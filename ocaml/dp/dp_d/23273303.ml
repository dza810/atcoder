//##// Contest ID: dp
//##// Problem ID: dp_d ( https://atcoder.jp/contests/dp/tasks/dp_d )
//##// Title: D. Knapsack 1
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-07 07:57:27 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23273303 ) 

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
let nn = get_int ()
let ww = get_int ()

let xs =
  let f _ =
    let w = get_int () in
    let v = get_int () in
    w, v
  in
  Array.init nn ~f
;;

let dp = Array.init (nn + 1) ~f:(fun _ -> Array.init (ww + 1) ~f:(fun _ -> 0))

let () =
  for i = 1 to nn do
    let w, v = xs.(i - 1) in
    for j = 0 to ww do
      dp.(i).(j) <- dp.(i - 1).(j);
        if j >= w then dp.(i).(j) <- Int.max (dp.(i - 1).(j - w) + v) dp.(i).(j) else ()
    done
  done
;;

let ans = dp.(nn) |> Array.fold ~init:0 ~f:Int.max |> Int.to_string
let () = ans |> print_endline
