//##// Contest ID: abc289
//##// Problem ID: abc289_b ( https://atcoder.jp/contests/abc289/tasks/abc289_b )
//##// Title: B. V
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-11 12:15:33 +0000 UTC ( https://atcoder.jp/contests/abc289/submissions/38790643 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let a = Array.init m ~f:(fun _ -> Scanf.scanf " %d" Fn.id)

let rec loop rev i j =
  if j >= n + 1 then ()
  else if i < m && a.(i) = j then loop (j :: rev) (i + 1) (j + 1)
  else (
    List.iter ~f:(fun v -> printf "%d " v) (j :: rev);
    loop [] i (j + 1))

let () =
  loop [] 0 1;
  print_endline ""
