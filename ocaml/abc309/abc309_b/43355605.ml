//##// Contest ID: abc309
//##// Problem ID: abc309_b ( https://atcoder.jp/contests/abc309/tasks/abc309_b )
//##// Title: B. Rotate
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-08 12:20:51 +0000 UTC ( https://atcoder.jp/contests/abc309/submissions/43355605 ) 

open IterLabels
open Core

let n = Scanf.scanf " %d" Fn.id

let aa =
  Array.init n ~f:(fun _ -> Array.init n ~f:(fun _ -> Scanf.scanf " %c" Fn.id))

let rot i j =
  if i = 0 && j = 0 then (1, 0)
  else if i = 0 && j = n - 1 then (0, n - 2)
  else if i = n - 1 && j = n - 1 then (n - 2, n - 1)
  else if i = n - 1 && j = 0 then (n - 1, 1)
  else if i = 0 then (i, j - 1)
  else if j = n - 1 then (i - 1, j)
  else if i = n - 1 then (i, j + 1)
  else if j = 0 then (i + 1, j)
  else (i, j)

let () =
  (0 -- (n - 1)) (fun i ->
      (0 -- (n - 1)) (fun j ->
          let i, j = rot i j in
          Printf.printf "%c" aa.(i).(j));
      print_endline "")
