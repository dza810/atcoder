//##// Contest ID: abc286
//##// Problem ID: abc286_c ( https://atcoder.jp/contests/abc286/tasks/abc286_c )
//##// Title: C. Rotate and Palindrome
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-27 12:58:59 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38357017 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let a = Scanf.scanf " %d" Fn.id
let b = Scanf.scanf " %d" Fn.id
let s = Array.init n ~f:(fun _ -> Scanf.scanf " %c" Fn.id)

let rec cnt ~ans ~i ~shift =
  let r = (i + shift) % n in
  let l = (n - 1 - i + shift) % n in
  if i = n / 2 then ans
  else
    let ans = ans + if Char.(s.(r) <> s.(l)) then 1 else 0 in
    cnt ~ans ~shift ~i:(i + 1)

let () =
  0 -- (n - 1)
  |> map ~f:(fun shift -> (a * shift) + (b * cnt ~ans:0 ~i:0 ~shift))
  |> min_exn ?lt:None |> Printf.printf "%d\n"
