//##// Contest ID: abc287
//##// Problem ID: abc287_d ( https://atcoder.jp/contests/abc287/tasks/abc287_d )
//##// Title: D. Match or Not
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-29 05:10:07 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38441573 ) 

open Core
open IterLabels

let s = Scanf.scanf " %s" Fn.id |> String.to_array
let t = Scanf.scanf " %s" Fn.id |> String.to_array
let len_s = Array.length s
let len_t = Array.length t
let char_equal x y = Char.(x = '?' || y = '?' || x = y)

let () =
  let ss = Array.sub s ~pos:(len_s - len_t) ~len:len_t in
  let tbl = Array.map2_exn ss t ~f:char_equal in
  let cnt = Array.count ~f:Fn.id tbl in
  let ans cnt = print_endline @@ if cnt = len_t then "Yes" else "No" in
  ans cnt;
  1 -- len_t
  |> fold ~init:(cnt, tbl) ~f:(fun (cnt, tbl) x ->
       let cnt =
         match tbl.(x - 1), char_equal s.(x - 1) t.(x - 1) with
         | false, true ->
           tbl.(x - 1) <- true;
           cnt + 1
         | true, false ->
           tbl.(x - 1) <- false;
           cnt - 1
         | true, true | false, false -> cnt
       in
       ans cnt;
       cnt, tbl)
  |> ignore
;;
