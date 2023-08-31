//##// Contest ID: abc276
//##// Problem ID: abc276_d ( https://atcoder.jp/contests/abc276/tasks/abc276_d )
//##// Title: D. Divide by 2 or 3
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-04 08:14:17 +0000 UTC ( https://atcoder.jp/contests/abc276/submissions/38589205 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let rec cnt p ans x = if x % p = 0 then cnt p (ans + 1) (x / p) else ans, x

let a =
  Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
  |> Array.map ~f:(fun x ->
       let c2, x = cnt 2 0 x in
       let c3, x = cnt 3 0 x in
       x, c2, c3)
;;

let c2min = a |> Array.map ~f:snd3 |> Array.reduce_exn ~f:Int.min
let c3min = a |> Array.map ~f:trd3 |> Array.reduce_exn ~f:Int.min

let () =
  let xs = a |> Array.map ~f:fst3 in
  if Array.for_all xs ~f:(( = ) xs.(0))
  then
    a
    |> Array.fold ~init:0 ~f:(fun acc (_, c2, c3) -> acc + (c2 - c2min) + (c3 - c3min))
    |> Printf.printf "%d\n"
  else Printf.printf "%d\n" (-1)
;;
