//##// Contest ID: typical90
//##// Problem ID: typical90_cd ( https://atcoder.jp/contests/typical90/tasks/typical90_cd )
//##// Title: 082. Counting Numbers（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 08:24:06 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37998560 ) 

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
let rec log10_num ?(ans = 0) x =
  if x =/ zero then ans - 1 else log10_num ~ans:(ans + 1) (x /// i2n 10)

let ll = sn ()
let ll_d = log10_num ll
let rr = sn ()
let rr_d = log10_num rr
let mm x = x %/ i2n 1_000_000_007

let rec pow_mod v a x =
  if x =/ zero then v
  else if x %/ two =/ zero then pow_mod v (mm @@ (a */ a)) (x /// two)
  else pow_mod (mm @@ (a */ v)) (mm @@ (a */ a)) (x /// two)

let div2 = pow_mod one two @@ i2n 1_000_000_005

let () =
  ll_d -- rr_d
  >|= (fun d ->
        let d = i2n d in
        let l = max_num (power_num (i2n 10) d) ll in
        let r = min_num (power_num (i2n 10) (d +/ one) -/ one) rr in
        mm @@ (mm (d +/ one) */ mm (r -/ l +/ one) */ (mm r +/ l) */ div2))
  |> fold ~init:zero ~f:(fun x y -> mm (mm x +/ mm y))
  |> mm |> string_of_num |> ps
