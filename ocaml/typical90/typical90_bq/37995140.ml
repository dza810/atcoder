//##// Contest ID: typical90
//##// Problem ID: typical90_bq ( https://atcoder.jp/contests/typical90/tasks/typical90_bq )
//##// Title: 069. Colorful Blocks 2（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 06:21:01 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37995140 ) 

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

let nn = sn ()
let kk = sn ()
let _mm = i2n 1_000_000_007
let mm x = x %/ _mm

let rec pow ans a x =
  if x =/ zero then ans else
  if x %/ two =/ zero then pow ans (a */ a) (x /// two)
  else pow (mm @@ (ans */ a)) (mm @@ (a */ a)) (x /// two)

let () =
  ps @@ string_of_num @@ mm
  @@
  if nn =/ one then kk
  else if nn =/ two then mm kk */ (mm (kk -/ one))
  else if kk >/ two then
    pow (mm (mm kk */ (mm @@ (kk -/ one)))) (mm @@ (kk -/ two)) (nn -/ two)
  else zero
