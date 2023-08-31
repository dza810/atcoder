//##// Contest ID: arc119
//##// Problem ID: arc119_a ( https://atcoder.jp/contests/arc119/tasks/arc119_a )
//##// Title: A. 119 × 2^23 + 1
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-05-22 13:25:45 +0000 UTC ( https://atcoder.jp/contests/arc119/submissions/22831531 ) 

open Core

let int_inf = Int.max_value

let n () = Scanf.scanf "%i" (fun i -> i)

let ans () =
  let n = n () in
  let b_min = 0 in
  let b_max = (n |> Float.of_int |> Float.log) /. log 2.0 |> Int.of_float in
  let calc b =
    let powb = Int.pow 2 b in
    let out = b + n + ((1 - powb) * (n / powb)) in
    out
  in
  List.range ~stop:`inclusive b_min b_max
  |> List.map ~f:calc
  |> List.fold ~f:min ~init:99999999999
  |> Int.to_string
;;

let () = ans () |> print_endline
