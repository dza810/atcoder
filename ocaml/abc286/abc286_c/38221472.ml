//##// Contest ID: abc286
//##// Problem ID: abc286_c ( https://atcoder.jp/contests/abc286/tasks/abc286_c )
//##// Title: C. Rotate and Palindrome
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-21 13:19:39 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38221472 ) 

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
let nn, aa, bb = si3 ()
let ss = Array.init nn ~f:sc

let rec count_b ca cnt i =
  if i = nn / 2 then cnt
  else
    let cnt =
      cnt
      + if Char.(ss.((i + ca) % nn) = ss.((nn - i - 1 + ca) % nn)) then 0 else 1
    in
    count_b ca cnt (i + 1)

let () =
  0 -- (nn - 1)
  |> map ~f:(fun ca ->
         let cb = count_b ca 0 0 in
         let c = (cb * bb) + (ca * aa) in
         c)
  |> min_exn ?lt:None |> pi
