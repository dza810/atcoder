//##// Contest ID: abc301
//##// Problem ID: abc301_d ( https://atcoder.jp/contests/abc301/tasks/abc301_d )
//##// Title: D. Bitmask
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-06 15:09:13 +0000 UTC ( https://atcoder.jp/contests/abc301/submissions/42044644 ) 

open IterLabels
open Core

let s = Scanf.scanf " %s" Fn.id |> String.rev |> String.to_array
let len = Array.length s
let n = Scanf.scanf " %d" Fn.id

let () =
  let v =
    s
    |> Array.foldi ~init:0 ~f:(fun i v x ->
           if Char.(s.(i) = '1') then v lor (1 lsl i) else v)
  in
  if v > n then printf "-1\n"
  else
    (len - 1) --^ 0
    |> fold ~init:v ~f:(fun v i ->
           if Char.(s.(i) = '?') && (v lor (1 lsl i)) <= n then v lor (1 lsl i)
           else v)
    |> printf "%d\n"
