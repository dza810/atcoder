//##// Contest ID: abc279
//##// Problem ID: abc279_d ( https://atcoder.jp/contests/abc279/tasks/abc279_d )
//##// Title: D. Freefall
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-31 08:22:42 +0000 UTC ( https://atcoder.jp/contests/abc279/submissions/38502026 ) 

open Core
open IterLabels

module Num = struct
  include Num

  let ( %/ ) x y = Num.mod_num x y
  let ( /// ) x y = floor_num @@ (x // y)

  let rec log10_num ?(ans = 0) x =
    if x =/ Int 0 then ans - 1 else log10_num ~ans:(ans + 1) (x /// Int 10)
  ;;

  let rec power_num ~mm v a x =
    if x =/ Int 0
    then v
    else if x %/ Int 2 =/ Int 0
    then power_num ~mm v (mm @@ (a */ a)) (x /// Int 2)
    else power_num ~mm (mm @@ (a */ v)) (mm @@ (a */ a)) (x /// Int 2)
  ;;
end

open Num

let a = Scanf.scanf " %s" Num.num_of_string
let b = Scanf.scanf " %s" Num.num_of_string
let p = a // b // Int 2

let rec bin_search ~f l r =
  if r -/ l <=/ Int 1
  then l
  else (
    let c = floor_num ((r -/ l) // Int 2) +/ l in
    if f c then bin_search ~f c r else bin_search ~f l c)
;;

let g =
  let f g = Float.(g */ g */ g <=/ p */ p) in
  bin_search ~f (Int 1) (Int 1 +/ (ceiling_num @@ (p */ Int 2 // Int 3)))
;;

let () =
  let t g =
    (float_of_num a /. (Float.sqrt @@ Num.float_of_num g))
    +. float_of_num (b */ (g -/ Int 1))
  in
  -10 -- 10
  |> filter ~f:(fun dg -> g +/ Int dg >=/ Int 1)
  |> map ~f:(fun dg -> t (g +/ Int dg))
  |> min_exn ?lt:None
  |> Printf.printf "%0.10f\n"
;;
