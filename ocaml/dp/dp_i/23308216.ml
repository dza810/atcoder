//##// Contest ID: dp
//##// Problem ID: dp_i ( https://atcoder.jp/contests/dp/tasks/dp_i )
//##// Title: I. Coins
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-09 07:08:44 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23308216 ) 

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

let n = Scanf.scanf "%d " id
let p = List.init n ~f:(fun _ -> Scanf.scanf "%f " id)
let dp = Array.init (n + 1) ~f:(fun _ -> 0.0)

let ans =
  dp.(0) <- 1.0;
  let rec aux dp = function
    | [] -> dp
    | p :: ps ->
      let dp =
        dp
        |> Array.folding_map ~init:0.0 ~f:(fun prev now ->
               let nnow = (prev *. p) +. (now *. (1.0 -. p)) in
               now, nnow)
      in
      aux dp ps
  in
  aux dp p
  |> Array.filteri ~f:(fun i _ -> i >= (n + 1) / 2)
  |> Array.fold ~init:0.0 ~f:( +. )
  |> Float.to_string
;;

let () = ans |> print_endline
