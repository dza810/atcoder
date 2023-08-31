//##// Contest ID: abc189
//##// Problem ID: abc189_c ( https://atcoder.jp/contests/abc189/tasks/abc189_c )
//##// Title: C. Mandarin Orange
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-01-28 01:22:22 +0000 UTC ( https://atcoder.jp/contests/abc189/submissions/19730831 ) 

open Core

let int_inf = 10000000000
let id x = x

let repeat ~f =
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
let xs = repeat ~f:(fun () -> Scanf.scanf "%d " id) [] n

let ans =
  let loop_right li =
    let _, max_calc_x, _ =
      List.fold_left li ~init:(int_inf, 0, 0) ~f:(fun (minx, max_calc_x, len) x ->
          let minx = min minx x in
          let max_calc_x = max max_calc_x (minx * (len + 1)) in
          minx, max_calc_x, len + 1)
    in
    max_calc_x
  in
  let rec loop_left li out =
    match li with
    | [] -> out |> List.fold_left ~f:max ~init:0
    | li ->
      let c = loop_right li in
      loop_left (List.tl_exn li) (c :: out)
  in
  loop_left xs [] |> Printf.sprintf "%d"
;;

let () = print_endline ans
