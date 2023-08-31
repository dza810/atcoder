//##// Contest ID: abc280
//##// Problem ID: abc280_d ( https://atcoder.jp/contests/abc280/tasks/abc280_d )
//##// Title: D. Factorial and Multiple
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-31 07:34:52 +0000 UTC ( https://atcoder.jp/contests/abc280/submissions/38501095 ) 

open Core
open IterLabels

let k = Scanf.scanf " %d" Fn.id

let rec loop1 ans k p =
  if p * p > k
  then Int.max ans k
  else (
    let rec loop2 k a = if k % p = 0 then loop2 (k / p) (a + 1) else k, a in
    let k, a = loop2 k 0 in
    let rec loop3 i x =
      let rec loop4 n a = if n % p = 0 then loop4 (n / p) (a + 1) else a in
      let x = loop4 (i * p) x in
      if x >= a then i * p else loop3 (i+1) x
    in
    let n = loop3 1 0 in
    let ans = Int.max n ans in
    loop1 ans k (p + 1))
;;

let () = Printf.printf "%d\n" @@ loop1 0 k 2
