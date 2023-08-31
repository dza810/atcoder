//##// Contest ID: abc270
//##// Problem ID: abc270_d ( https://atcoder.jp/contests/abc270/tasks/abc270_d )
//##// Title: D. Stones
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-08 14:57:15 +0000 UTC ( https://atcoder.jp/contests/abc270/submissions/38720345 ) 

open Core
open IterLabels

let n, k = Scanf.scanf " %d %d" Tuple2.create
let a = Array.init k ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let dptbl = Array.init (n + 1) ~f:(fun i -> if i = 1 then 1 else 0)

let () =
  for i = 1 to n do
    Array.iter a ~f:(fun a ->
      if i - a >= 0 then dptbl.(i) <- Int.max dptbl.(i) @@ (i - dptbl.(i - a)))
  done
;;

let () = Printf.printf "%d\n" @@ dptbl.(n)