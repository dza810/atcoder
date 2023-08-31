//##// Contest ID: abc310
//##// Problem ID: abc310_a ( https://atcoder.jp/contests/abc310/tasks/abc310_a )
//##// Title: A. Order Something Else
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-22 11:48:31 +0000 UTC ( https://atcoder.jp/contests/abc310/submissions/43826133 ) 

open IterLabels
open Core

let n, p, q = Scanf.scanf " %d %d %d" Tuple3.create

let d = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id) |> of_array |> min_exn ?lt:None

let () =
  Printf.printf "%d\n" @@ Int.min p (q + d)
