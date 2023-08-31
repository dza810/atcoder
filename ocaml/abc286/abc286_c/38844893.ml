//##// Contest ID: abc286
//##// Problem ID: abc286_c ( https://atcoder.jp/contests/abc286/tasks/abc286_c )
//##// Title: C. Rotate and Palindrome
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-12 12:51:47 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38844893 ) 

open Core
open IterLabels

let n, a, b = Scanf.scanf " %d %d %d" Tuple3.create
let s = Scanf.scanf " %s" String.to_array

let rec calc ~shft cnt i =
  let l = (i + shft) % n in
  let r = (n - i - 1 + shft) % n in
  if 2 * i >= n then cnt
  else
    let cnt = cnt + if Char.(s.(l) = s.(r)) then 0 else 1 in
    calc ~shft cnt (i + 1)

let () =
  0 -- (n - 1)
  |> map ~f:(fun shft -> (a * shft) + (b * calc ~shft 0 0))
  |> min_exn ?lt:None |> Printf.printf "%d\n"
