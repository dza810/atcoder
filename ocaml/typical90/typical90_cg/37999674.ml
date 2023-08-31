//##// Contest ID: typical90
//##// Problem ID: typical90_cg ( https://atcoder.jp/contests/typical90/tasks/typical90_cg )
//##// Title: 085. Multiplication 085（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 09:03:29 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37999674 ) 

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

  let rec log10_num ?(ans = 0) x =
    if x =/ zero then ans - 1 else log10_num ~ans:(ans + 1) (x /// i2n 10)

  let rec power_num ~mm v a x =
    if x =/ zero then v
    else if x %/ two =/ zero then power_num ~mm v (mm @@ (a */ a)) (x /// two)
    else power_num ~mm (mm @@ (a */ v)) (mm @@ (a */ a)) (x /// two)
end

open Num

(* open IterLabels.Infix *)
open IterLabels

(************)
let kk = si ()

let divs =
  1 -- Int.sqrt kk |> filter ~f:(fun x -> kk % x = 0) |> persistent_lazy

let loop_b a x =
  divs
  |> filter ~f:(fun v -> x % v = 0 && x >= v * v && v >= a)
  |> map ~f:(fun v ->
          (* printf "%d, %d, %d\n" (kk / x) v (x / v); *)
         x)
  |> length

let loop_a x =
  divs
  |> map ~f:(fun v -> if x % v = 0 && x >= v * v * v then loop_b v (x / v) else 0)
  |> sum

let () = loop_a kk |> pi