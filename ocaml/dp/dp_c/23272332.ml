//##// Contest ID: dp
//##// Problem ID: dp_c ( https://atcoder.jp/contests/dp/tasks/dp_c )
//##// Title: C. Vacation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-07 07:14:09 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23272332 ) 

open Core

let int_inf = Int.max_value_30_bits
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let n = Scanf.scanf "%d\n" id
let abc = Array.init n ~f:(fun _ -> Array.init 3 ~f:(fun _ -> Scanf.scanf "%d " id))
let dp = Array.init n ~f:(fun _ -> Array.init 3 ~f:(fun _ -> 0))

let () =
  dp.(0).(0) <- abc.(0).(0);
  dp.(0).(1) <- abc.(0).(1);
  dp.(0).(2) <- abc.(0).(2);
  for i = 1 to n - 1 do
    dp.(i).(0) <- abc.(i).(0) + Int.max dp.(i - 1).(1) dp.(i - 1).(2);
    dp.(i).(1) <- abc.(i).(1) + Int.max dp.(i - 1).(0) dp.(i - 1).(2);
    dp.(i).(2) <- abc.(i).(2) + Int.max dp.(i - 1).(0) dp.(i - 1).(1)
  done
;;

(* *)
let ans =
  (* *)
  dp.(n - 1) |> Array.fold ~f:Int.max ~init:0 |> Int.to_string
;;

let () = ans |> print_endline
