//##// Contest ID: abc287
//##// Problem ID: abc287_a ( https://atcoder.jp/contests/abc287/tasks/abc287_a )
//##// Title: A. Majority
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-29 03:11:37 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38439172 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id

let () =
  let b = (1 -- n) |> map ~f:(fun _ -> 
    String.("For" = Scanf.scanf " %s" Fn.id)
    ) |> filter_count ~f:Fn.id
  in
  Printf.printf "%s\n" @@ if b > n / 2 then "Yes" else "No"