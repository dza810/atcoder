//##// Contest ID: abc315
//##// Problem ID: abc315_b ( https://atcoder.jp/contests/abc315/tasks/abc315_b )
//##// Title: B. The Middle Day
//##// Language: OCaml (ocamlopt 5.0.0)
//##// Submitted: 2023-08-21 13:44:22 +0000 UTC ( https://atcoder.jp/contests/abc315/submissions/44827684 ) 

open IterLabels
open Core

let m = Scanf.scanf " %d" Fn.id
let dm = Array.init m ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let yd = dm |> of_array |> sum
let rec f m d = if dm.(m) >= d then (m + 1, d) else f (m + 1) (d - dm.(m))
let () = f 0 ((yd / 2) + 1) |> fun (m, d) -> Printf.printf "%d %d\n" m d
