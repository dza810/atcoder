//##// Contest ID: abc275
//##// Problem ID: abc275_d ( https://atcoder.jp/contests/abc275/tasks/abc275_d )
//##// Title: D. Yet Another Recursive Function
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-07 11:06:36 +0000 UTC ( https://atcoder.jp/contests/abc275/submissions/38692429 ) 

open Core
open IterLabels

let memo = Caml.Hashtbl.create 1_000_000

let rec f x =
  if x = 0 then 1 else
  match Caml.Hashtbl.find_opt memo x with
  | Some v -> v
  | None ->
    let v = f (x / 2) + f (x / 3) in
    Caml.Hashtbl.add memo x v;
    v
;;

let n = Scanf.scanf " %d" Fn.id
let () = Printf.printf "%d\n" @@ f n