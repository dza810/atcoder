//##// Contest ID: abc288
//##// Problem ID: abc288_d ( https://atcoder.jp/contests/abc288/tasks/abc288_d )
//##// Title: D. Range Add Query
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-05 02:15:51 +0000 UTC ( https://atcoder.jp/contests/abc288/submissions/38634848 ) 

open Core
open IterLabels

let n, k = Scanf.scanf " %d %d" Tuple2.create
let a = Array.init n ~f:(fun i -> Scanf.scanf " %d" Fn.id)
let q = Scanf.scanf " %d" Fn.id

let s =
  let s = Array.make_matrix ~dimx:k ~dimy:(n + 1) 0 in
  (0 -- (k - 1)) (fun kk ->
    (0 -- (n - 1)) (fun nn ->
      s.(kk).(nn + 1) <- (s.(kk).(nn) + if nn % k = kk then a.(nn) else 0)));
  s
;;

let check l r =
  let s0 = s.(0).(r) - s.(0).(l) in
  1 -- (k - 1) |> for_all ~f:(fun kk -> s0 = s.(kk).(r) - s.(kk).(l))
;;

let () =
  for _ = 1 to q do
    let l, r = Scanf.scanf " %d %d" Tuple2.create in
    let flg = check (l - 1) r in
    Printf.printf "%s\n" @@ if flg then "Yes" else "No"
  done
;;
