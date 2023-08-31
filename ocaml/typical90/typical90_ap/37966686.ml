//##// Contest ID: typical90
//##// Problem ID: typical90_ap ( https://atcoder.jp/contests/typical90/tasks/typical90_ap )
//##// Title: 042. Multiple of 9（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-12 15:32:50 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37966686 ) 

open Printf
open Core

module M = struct
  open Scanf

  module Int = struct
    let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

    include Int
  end

  let id = Fn.id
  let si _ = scanf " %d" id
  let sc _ = scanf " %c" id
  let ss _ = scanf " %s" id
  let si2 _ = scanf " %d %d" (fun x y -> (x, y))
  let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
  let pi x = printf "%d\n" x
  let pf x = printf "%0.10f\n" x
  let ps x = printf "%s\n" x
end

open M

(* open IterLabels.Infix *)
open IterLabels

(************)

let mm v = v % 1_000_000_007
let sum_mod = fold ~init:0 ~f:(fun acc v -> mm (acc + v))
let kk = si ()
let dptbl = Array.create ~len:9 0
let cache = Hashtbl.create(module Int)
let rec dp i =
  Hashtbl.find_or_add cache i ~default:(fun () ->
    match i with
  | 0 -> 1
  | i -> 1 -- Int.min i 9 |> map ~f:(fun j -> dp (i - j)) |> sum_mod
  )

let () = if kk % 9 <> 0 then pi 0 else pi @@ dp kk