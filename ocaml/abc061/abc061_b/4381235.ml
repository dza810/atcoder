//##// Contest ID: abc061
//##// Problem ID: abc061_b ( https://atcoder.jp/contests/abc061/tasks/abc061_b )
//##// Title: B. Counting Roads
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-25 01:25:06 +0000 UTC ( https://atcoder.jp/contests/abc061/submissions/4381235 ) 

open Batteries

let () =
  let n, m = Scanf.scanf " %d %d\n" (fun n m -> (n, m)) in
  let arr = Array.make n 0 in
  let () =
    1 -- m
    |> Enum.iter (fun _ ->
           Scanf.scanf " %d %d" (fun n m ->
               arr.(n - 1) <- arr.(n - 1) + 1 ;
               arr.(m - 1) <- arr.(m - 1) + 1 ) )
  in
  let () = Array.iter (fun x -> Printf.printf "%d\n" x) arr in
  ()
