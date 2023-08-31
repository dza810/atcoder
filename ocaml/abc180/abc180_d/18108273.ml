//##// Contest ID: abc180
//##// Problem ID: abc180_d ( https://atcoder.jp/contests/abc180/tasks/abc180_d )
//##// Title: D. Takahashi Unevolved
//##// Language: OCaml (4.10.0)
//##// Submitted: 2020-11-15 04:26:24 +0000 UTC ( https://atcoder.jp/contests/abc180/submissions/18108273 ) 

open Core

let id x = x
let x = Scanf.scanf "%d " id
let y = Scanf.scanf "%d " id
let a = Scanf.scanf "%d " id
let b = Scanf.scanf "%d " id

let ans =
  let rec f c x =
    if x <= (x + b) / a && x <= (y - 1) / a
    then f (c + 1) (a * x)
    else c + ((y - x - 1) / b)
  in
  f 0 x |> Int.to_string
;;

let () = Printf.printf "%s\n%!" ans
