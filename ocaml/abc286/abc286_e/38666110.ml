//##// Contest ID: abc286
//##// Problem ID: abc286_e ( https://atcoder.jp/contests/abc286/tasks/abc286_e )
//##// Title: E. Souvenir
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-06 08:12:01 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38666110 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let ( ++ ) (a, b) (p, q) = a + p, b + q

let dist =
  Array.init n ~f:(fun i ->
    Array.init n ~f:(fun j ->
      let c = Scanf.scanf " %c" Fn.id in
      if i = j
      then 0, 0
      else (if Char.(c = 'Y') then 1 else Int.max_value_30_bits), -a.(j)))
;;

let () =
  0 -- (n - 1)
  |> iter ~f:(fun k ->
       0 -- (n - 1)
       |> iter ~f:(fun i ->
            0 -- (n - 1)
            |> iter ~f:(fun j ->
                 if Poly.(dist.(i).(j) > dist.(i).(k) ++ dist.(k).(j))
                 then dist.(i).(j) <- dist.(i).(k) ++ dist.(k).(j))))
;;

let q = Scanf.scanf " %d" Fn.id

let () =
  for _ = 1 to q do
    let u, v = Scanf.scanf " %d %d" Tuple2.create in
    let u, v = u - 1, v - 1 in
    let c, s = dist.(u).(v) in
    if c >= Int.max_value_30_bits
    then Printf.printf "%s\n" "Impossible"
    else Printf.printf "%d %d\n" c (-s + a.(u))
  done
;;
