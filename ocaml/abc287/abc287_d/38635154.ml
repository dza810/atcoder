//##// Contest ID: abc287
//##// Problem ID: abc287_d ( https://atcoder.jp/contests/abc287/tasks/abc287_d )
//##// Title: D. Match or Not
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-05 02:37:16 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38635154 ) 

open Core
open IterLabels

let s = Scanf.scanf " %s" Fn.id |> String.to_array
let len_s = Array.length s
let t = Scanf.scanf " %s" Fn.id |> String.to_array
let len_t = Array.length t
let char_eq x y = Char.(x = '?' || y = '?' || x = y)

let () =
  let cnt =
    0 -- (len_t - 1) |> filter_count ~f:(fun i -> char_eq t.(i) s.(len_s - len_t + i))
  in
  let () = Printf.printf "%s\n" @@ if cnt = len_t then "Yes" else "No" in
  1 -- len_t
  |> fold ~init:cnt ~f:(fun cnt x ->
       let cnt =
         cnt
         - (if char_eq t.(x - 1) s.(len_s - (len_t - x + 1)) then 1 else 0)
         + if char_eq t.(x - 1) s.(x - 1) then 1 else 0
       in
       Printf.printf "%s\n" @@ if cnt = len_t then "Yes" else "No";
       cnt)
  |> ignore
;;
