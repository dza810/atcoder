//##// Contest ID: abc285
//##// Problem ID: abc285_c ( https://atcoder.jp/contests/abc285/tasks/abc285_c )
//##// Title: C. abc285_brutmhyhiizp
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-15 12:25:10 +0000 UTC ( https://atcoder.jp/contests/abc285/submissions/38056142 ) 

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
end

open M
open M.Num

(* open IterLabels.Infix *)
open IterLabels

(************)

let () =
  ss () 
  |> String.to_list 
  |> List.map ~f:(fun c -> Char.(to_int c - to_int 'A'))
  |> List.fold ~init:0 ~f:(fun acc x -> acc * 26 + x + 1)
  |> pi
