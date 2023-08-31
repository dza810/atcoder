//##// Contest ID: dp
//##// Problem ID: dp_a ( https://atcoder.jp/contests/dp/tasks/dp_a )
//##// Title: A. Frog 1
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-07 06:32:16 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23271489 ) 

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
let h = repeat ~f:(fun () -> Scanf.scanf "%d " id) [] n |> Array.of_list

(* *)
let dp = Array.init ~f:(fun _ -> int_inf) n
let get_h i j = Int.abs (h.(i) - h.(j))

let () =
  dp.(0) <- 0;
  dp.(1) <- Int.abs (h.(1) - h.(0));
  for j = 2 to n - 1 do
    dp.(j) <- min (dp.(j - 1) + get_h (j - 1) j) (dp.(j - 2) + get_h (j - 2) j)
  done
;;

let ans =
  (* *)
  dp.(n - 1) |> Int.to_string
;;

let () = ans |> print_endline
