//##// Contest ID: abc287
//##// Problem ID: abc287_d ( https://atcoder.jp/contests/abc287/tasks/abc287_d )
//##// Title: D. Match or Not
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-29 04:13:27 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38440425 ) 

open Core
open IterLabels

let s = Scanf.scanf " %s" Fn.id |> String.to_array
let t = Scanf.scanf " %s" Fn.id |> String.to_array
let len_s = Array.length s
let len_t = Array.length t

let char_equal x y =
  match x, y with
  | '?', _ | _, '?' -> true
  | x, y -> Char.(x = y)
;;

let () =
  let tbl = Array.create ~len:len_t false in
  let ans cnt = print_endline @@ if cnt = len_t then "Yes" else "No" in
  let cnt, tbl =
    0 -- len_t
    |> fold ~init:(0, tbl) ~f:(fun (cnt, tbl) x ->
         if x = 0
         then (
           let ss = Array.sub s ~pos:(len_s - len_t) ~len:len_t in
           let tbl = Array.map2_exn ss t ~f:char_equal in
           let cnt = Array.count ~f:Fn.id tbl in
           ans cnt;
           cnt, tbl)
         else if char_equal s.(x - 1) t.(x - 1)
         then (
           let cnt = if not @@ tbl.(x - 1) then cnt + 1 else cnt in
           tbl.(x - 1) <- true;
           ans cnt;
           cnt, tbl)
         else (
           let cnt = if tbl.(x - 1) then cnt - 1 else cnt in
           tbl.(x - 1) <- false;
           ans cnt;
           cnt, tbl))
  in
  ()
;;
