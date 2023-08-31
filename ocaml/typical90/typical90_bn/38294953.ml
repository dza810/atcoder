//##// Contest ID: typical90
//##// Problem ID: typical90_bn ( https://atcoder.jp/contests/typical90/tasks/typical90_bn )
//##// Title: 066. Various Arrays（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-24 04:11:51 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38294953 ) 

open Core
open Printf
open Scanf
open IterLabels
open Num

let nn = scanf " %d" Fn.id
let p = Array.init nn ~f:(fun _ -> scanf " %d %d" (fun x y -> (x, y)))

let () =
  1 -- nn
  |> map ~f:(fun i ->
         let il, ir = p.(i - 1) in
         i + 1 -- nn
         |> map ~f:(fun j ->
                let jl, jr = p.(j - 1) in
                let v : int =
                  il -- ir
                  |> map ~f:(fun ii ->
                         jl -- jr |> filter_count ~f:(fun jj -> ii > jj))
                  |> sum
                in
                Int v // Int (ir - il + 1) // Int (jr - jl + 1))
         |> fold ~init:(Int 0) ~f:(fun acc v -> acc +/ v))
  |> fold ~init:(Int 0) ~f:(fun acc v -> acc +/ v)
  |> float_of_num |> printf "%.12f\n"
