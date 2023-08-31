//##// Contest ID: abc067
//##// Problem ID: abc067_b ( https://atcoder.jp/contests/abc067/tasks/abc067_b )
//##// Title: B. Snake Toy
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 13:34:18 +0000 UTC ( https://atcoder.jp/contests/abc067/submissions/4376530 ) 

open Batteries

let rec print_int_list = function
  | [] -> print_endline "DONE"
  | x :: xs -> Printf.printf "%d " x ; print_int_list xs

let () =
  let n, k = Scanf.scanf " %d %d " (fun n k -> (n, k)) in
  List.init n (fun _ -> Scanf.scanf " %d" (fun li -> li))
  |> List.sort (fun x y -> y - x)
  (* |> print_int_list *)
  |> List.take k |> List.fold_left ( + ) 0 |> Printf.printf "%d\n"
