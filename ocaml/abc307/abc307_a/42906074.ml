//##// Contest ID: abc307
//##// Problem ID: abc307_a ( https://atcoder.jp/contests/abc307/tasks/abc307_a )
//##// Title: A. Weekly Records
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-24 12:21:39 +0000 UTC ( https://atcoder.jp/contests/abc307/submissions/42906074 ) 

open IterLabels
open Core

let n = Scanf.scanf " %d" Fn.id

let _ =
  Array.init n ~f:(fun i ->
      Array.init 7 ~f:(fun j -> Scanf.scanf " %d" Fn.id)
      |> Array.fold ~init:0 ~f:( + )
      |> Printf.printf "%d ")

let () = Printf.printf "\n" 
