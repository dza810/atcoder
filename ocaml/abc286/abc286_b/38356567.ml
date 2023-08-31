//##// Contest ID: abc286
//##// Problem ID: abc286_b ( https://atcoder.jp/contests/abc286/tasks/abc286_b )
//##// Title: B. Cat
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-27 12:38:50 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38356567 ) 

open Core

let n = Scanf.scanf " %d" Fn.id

let s = List.init n ~f:(fun _ -> Scanf.scanf " %c" Fn.id) |> List.rev

let rec calc = function
  | [] -> printf "\n%!"
  | 'n' :: 'a' :: tl -> print_string "nya"; calc tl
  | hd :: tl -> printf "%c" hd; calc tl

let () = calc s