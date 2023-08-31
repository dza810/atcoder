//##// Contest ID: typical90
//##// Problem ID: typical90_bx ( https://atcoder.jp/contests/typical90/tasks/typical90_bx )
//##// Title: 076. Cake Cut（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 07:44:24 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37997536 ) 

open Printf
open Core

module M = struct
  open Scanf

  let ( @. ) f g x = f (g x)

  module Int = struct
    let sqrt = Int.of_float @. Float.sqrt @. Float.of_int

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

module Num = struct
  include Num

  let sn _ = Scanf.scanf " %s" num_of_string
  let ( %/ ) x y = mod_num x y
  let ( /// ) x y = floor_num @@ (x // y)
  let i2n = num_of_int
  let zero = num_of_int 0
  let one = num_of_int 1
  let two = num_of_int 2
end

open Num

(* open IterLabels.Infix *)
open IterLabels

(************)

let nn = si ()
let aa = Array.init nn ~f:si
let sum = Array.reduce_exn ~f:( + ) aa

let aa =
  Array.append aa aa
  |> Array.folding_map ~init:0 ~f:(fun acc x -> (x + acc, acc * 10))

let rec loop l r =
  if r + 1 >= 2 * nn && l >= nn then "No"
  else if aa.(r + 1) - aa.(l) = sum then "Yes"
  else if aa.(r + 1) - aa.(l) > sum then loop (l + 1) r
  else loop l (r + 1)

let () = ps @@ loop 0 0
