//##// Contest ID: abc275
//##// Problem ID: abc275_c ( https://atcoder.jp/contests/abc275/tasks/abc275_c )
//##// Title: C. Counting Squares
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-06 06:15:36 +0000 UTC ( https://atcoder.jp/contests/abc275/submissions/38663638 ) 

open IterLabels
open Core

let ( let* ) x f = Option.bind ~f x
let some x = Some x
let s = Array.init 9 ~f:(fun _ -> Array.init 9 ~f:(fun _ -> Scanf.scanf " %c" Fn.id))
let x p = p / 9
let y p = p % 9
let rot (x, y) = y, -x

let p p (dx, dy) =
  let x = x p + dx in
  let y = y p + dy in
  if 0 <= x && x <= 8 && 0 <= y && y <= 8 then some @@ ((x * 9) + y) else None
;;

let is_ok p1 p2 : bool =
  Option.is_some
  @@
  let d = x p2 - x p1, y p2 - y p1 in
  let d = rot d in
  let* p3 = p p2 d in
  let d = rot d in
  let* p4 = p p3 d in
  let d = rot d in
  let* p5 = p p4 d in
  assert (p1 = p5);
  if p1 < p3 && p1 < p4 && Char.(s.(x p3).(y p3) = '#' && s.(x p4).(y p4) = '#')
  then Some ()
  else None
;;

let () =
  let ans = ref 0 in
  for p1 = 0 to 80 do
    if Char.(s.(x p1).(y p1) = '#')
    then
      for p2 = p1 + 1 to 80 do
        if Char.(s.(x p2).(y p2) = '#') then if is_ok p1 p2 then Int.incr ans
      done
  done;
  Printf.printf "%d\n" @@ !ans
;;
