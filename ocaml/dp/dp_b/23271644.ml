//##// Contest ID: dp
//##// Problem ID: dp_b ( https://atcoder.jp/contests/dp/tasks/dp_b )
//##// Title: B. Frog 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-07 06:40:36 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23271644 ) 

open Core

let int_inf = Int.max_value / 2
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let n, k = Scanf.scanf "%d %d " (fun n k -> n, k)
let h = repeat ~f:(fun () -> Scanf.scanf "%d " id) [] n |> Array.of_list

(* *)
let dp = Array.init ~f:(fun _ -> int_inf) n
let get_h i j = Int.abs (h.(i) - h.(j))

let () =
  dp.(0) <- 0;
  for j = 1 to n - 1 do
    dp.(j)
      <- List.init k ~f:(fun k ->
             if j - k - 1 < 0 then int_inf else dp.(j - k - 1) + get_h (j - k - 1) j)
         |> List.fold ~init:int_inf ~f:min
  done
;;

let ans =
  (* *)
  dp.(n - 1) |> Int.to_string
;;

let () = ans |> print_endline
