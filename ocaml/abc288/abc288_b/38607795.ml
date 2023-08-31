//##// Contest ID: abc288
//##// Problem ID: abc288_b ( https://atcoder.jp/contests/abc288/tasks/abc288_b )
//##// Title: B. Qualification Contest
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-04 12:09:19 +0000 UTC ( https://atcoder.jp/contests/abc288/submissions/38607795 ) 

open Core
open IterLabels

let n, k = Scanf.scanf " %d %d" Tuple2.create
let s = Array.init n ~f:(fun _ -> Scanf.scanf " %s" Fn.id)
let () = Array.sort ~pos:0 ~len:k s ~compare:String.compare

let () =
  for k = 0 to k - 1 do
    Printf.printf "%s\n" s.(k)
  done
;;
