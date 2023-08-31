//##// Contest ID: abc042
//##// Problem ID: abc042_b ( https://atcoder.jp/contests/abc042/tasks/abc042_b )
//##// Title: B. Iroha Loves Strings (ABC Edition)
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 13:49:02 +0000 UTC ( https://atcoder.jp/contests/abc042/submissions/4377347 ) 

open Batteries
 
let () =
  let n = Scanf.scanf " %d %d\n" (fun n _ -> n) in
  List.init n (fun _ -> Scanf.scanf "%s\n" (fun x -> x))
  |> List.sort compare
  |> List.fold_left (fun x y -> x ^ y) ""
  |> print_endline
