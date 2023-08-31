//##// Contest ID: abc071
//##// Problem ID: abc071_b ( https://atcoder.jp/contests/abc071/tasks/abc071_b )
//##// Title: B. Not Found
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 14:49:33 +0000 UTC ( https://atcoder.jp/contests/abc071/submissions/4378514 ) 

open Batteries

let ( ++ ) x y = int_of_char x + y |> char_of_int

let () =
  Scanf.scanf "%s\n" String.to_list
  |> List.sort_uniq compare
  |> List.fold_left (fun x y -> if x = y then x ++ 1 else x) 'a'
  |> (fun x -> if x > 'z' then "None" else String.of_char x)
  |> print_endline
