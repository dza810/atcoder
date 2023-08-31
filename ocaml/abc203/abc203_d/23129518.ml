//##// Contest ID: abc203
//##// Problem ID: abc203_d ( https://atcoder.jp/contests/abc203/tasks/abc203_d )
//##// Title: D. Pond
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-02 08:48:45 +0000 UTC ( https://atcoder.jp/contests/abc203/submissions/23129518 ) 

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

let get_int () = Scanf.scanf "%d " (fun i -> i)
let n = get_int ()
let k = get_int ()
let aij = repeat ~f:(fun () -> repeat ~f:get_int [] n) [] n
let aij = aij |> List.map ~f:Array.of_list |> Array.of_list

let is_ok x =
  let m = (k * k / 2) + 1 in
  let cij = Array.init (n + 1) ~f:(fun _ -> Array.init (n + 1) ~f:(fun _ -> 0)) in
  for i = 1 to n do
    for j = 1 to n do
      let n = if aij.(i - 1).(j - 1) > x then 1 else 0 in
      cij.(i).(j) <- n + cij.(i - 1).(j) + cij.(i).(j - 1) - cij.(i - 1).(j - 1)
    done
  done;
  let rec loop_i = function
    | i when i > n -> false
    | i ->
      let rec loop_j = function
        | j when j > n -> loop_i (i + 1)
        | j ->
          if m > cij.(i).(j) - cij.(i - k).(j) - cij.(i).(j - k) + cij.(i - k).(j - k)
          then true
          else loop_j (j + 1)
      in
      loop_j k
  in
  loop_i k
;;

let bin_search ~l ~r ~f =
  let rec aux l r =
    if r - l < 2
    then r
    else (
      let v = l + ((r - l) / 2) in
      if f v then aux l v else aux v r)
  in
  aux l r
;;

let ans () =
  let l = -1 in
  let r = 1_000_000_000 in
  let f = is_ok in
  bin_search ~l ~r ~f |> Int.to_string |> print_endline
;;

let () = ans ()
