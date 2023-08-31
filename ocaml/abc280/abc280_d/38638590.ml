//##// Contest ID: abc280
//##// Problem ID: abc280_d ( https://atcoder.jp/contests/abc280/tasks/abc280_d )
//##// Title: D. Factorial and Multiple
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-05 05:47:05 +0000 UTC ( https://atcoder.jp/contests/abc280/submissions/38638590 ) 

open Core
open IterLabels

let k = Scanf.scanf " %d" Fn.id

let p =
  let rec aux ans k i =
    if i * i > k
    then Int.max k ans
    else (
      let rec count cnt k = if k % i = 0 then count (cnt + 1) (k / i) else cnt, k in
      let cnt, k = count 0 k in
      let rec loop cnt n =
        if cnt = 0
        then 0
        else (
          let cnt = cnt - 1 - (fst @@ count 0 n) in
          if cnt <= 0 then n * i else loop cnt (n + 1))
      in
      let ans = Int.max ans (loop cnt 1) in
      aux ans k (i + 1))
  in
  aux 0 k 2 |> Printf.printf "%d\n"
;;
