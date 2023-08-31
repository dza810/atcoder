//##// Contest ID: abc275
//##// Problem ID: abc275_c ( https://atcoder.jp/contests/abc275/tasks/abc275_c )
//##// Title: C. Counting Squares
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-06 06:40:37 +0000 UTC ( https://atcoder.jp/contests/abc275/submissions/38664153 ) 

open IterLabels
open Core

exception NG

let ( let* ) x f = Option.bind ~f x
let some x = Some x
let s = Array.init 9 ~f:(fun _ -> Array.init 9 ~f:(fun _ -> Scanf.scanf " %c" Fn.id))
let x p = p / 9
let y p = p % 9
let is_pawn p = Char.(s.(x p).(y p) = '#')
let rot (x, y) = y, -x

let p p (dx, dy) =
  let x = x p + dx in
  let y = y p + dy in
  if 0 <= x && x <= 8 && 0 <= y && y <= 8 then (x * 9) + y else raise NG
;;

let is_ok p1 p2 =
  let d = x p2 - x p1, y p2 - y p1 in
  let d = rot d in
  let p3 = p p2 d in
  if not @@ (p1 < p3 && is_pawn p3) then raise NG;
  let d = rot d in
  let p4 = p p3 d in
  if not @@ (p1 < p4 && is_pawn p4) then raise NG;
  ()
;;

let () =
  let init = 0 in
  0 -- 80
  |> filter ~f:is_pawn
  |> fold ~init ~f:(fun init p1 ->
       p1 + 1 -- 80
       |> filter ~f:is_pawn
       |> fold ~init ~f:(fun ans p2 ->
            try
              is_ok p1 p2;
              ans + 1
            with
            | NG -> ans))
  |> Printf.printf "%d\n"
;;
