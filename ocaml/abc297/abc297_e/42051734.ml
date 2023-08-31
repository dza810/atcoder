//##// Contest ID: abc297
//##// Problem ID: abc297_e ( https://atcoder.jp/contests/abc297/tasks/abc297_e )
//##// Title: E. Kth Takoyaki Set
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-07 05:06:26 +0000 UTC ( https://atcoder.jp/contests/abc297/submissions/42051734 ) 

open IterLabels
open Core

let n, k = Scanf.scanf " %d %d" Tuple2.create
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let q = Set.empty (module Int)
let q = Set.add q 0
let ans = Array.init (k + 1) ~f:(Fn.const (-1))

let rec calc i q =
  if i = k + 1 then ans.(k)
  else
    let v = Set.min_elt_exn q in
    let q = Set.remove q v in
    if i > 0 && v = ans.(i - 1) then calc i q
    else (
      ans.(i) <- v;
      Array.fold a ~init:q ~f:(fun q aa -> Set.add q (v + aa)) |> calc (i + 1))

let () = calc 0 q |> printf "%d\n"