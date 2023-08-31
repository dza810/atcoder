//##// Contest ID: abc289
//##// Problem ID: abc289_d ( https://atcoder.jp/contests/abc289/tasks/abc289_d )
//##// Title: D. Step Up Robot
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-11 13:55:22 +0000 UTC ( https://atcoder.jp/contests/abc289/submissions/38818782 ) 

open Core
open IterLabels
module ISet = Set.Make (Int)

let n = Scanf.scanf " %d" Fn.id
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let m = Scanf.scanf " %d" Fn.id
let b = 1 -- m |> map ~f:(fun _ -> Scanf.scanf " %d" Fn.id) |> ISet.of_iter
let x = Scanf.scanf " %d" Fn.id
let memo = Caml.Hashtbl.create 1_000_000

let rec dp x =
  if x = 0 then true
  else if x < 0 then false
  else if ISet.mem x b then false
  else
    match Caml.Hashtbl.find_opt memo x with
    | Some v -> v
    | None ->
        let v = a |> Array.exists ~f:(fun v -> dp (x - v)) in
        Caml.Hashtbl.add memo x v;
        v

let () = print_endline @@ if dp x then "Yes" else "No"
