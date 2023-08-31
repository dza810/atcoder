//##// Contest ID: abc204
//##// Problem ID: abc204_c ( https://atcoder.jp/contests/abc204/tasks/abc204_c )
//##// Title: C. Tour
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-07 05:07:48 +0000 UTC ( https://atcoder.jp/contests/abc204/submissions/23269815 ) 

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
let m = Scanf.scanf "%d " id
let a_to_b = Array.init ~f:(fun _ -> []) n

let ab =
  repeat
    ~f:(fun () ->
      let a, b = Scanf.scanf "%d %d " (fun a b -> a, b) in
      a_to_b.(a - 1) <- (b - 1) :: a_to_b.(a - 1))
    []
    m
;;

let tmp () = Array.init ~f:(fun _ -> false) n

let dft start =
  let tmp = tmp () in
  tmp.(start) <- true;
  let rec aux start =
    List.iter a_to_b.(start) ~f:(fun x ->
        if tmp.(x)
        then ()
        else (
          tmp.(x) <- true;
          aux x))
  in
  aux start;
  tmp |> Array.count ~f:id
;;

let ans =
  let rec aux out x =
    if x >= n
    then out
    else (
      let out = out + dft x in
      aux out (x + 1))
  in
  aux 0 0 |> Int.to_string
;;

let () = ans |> print_endline
