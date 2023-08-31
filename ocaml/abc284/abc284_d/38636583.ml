//##// Contest ID: abc284
//##// Problem ID: abc284_d ( https://atcoder.jp/contests/abc284/tasks/abc284_d )
//##// Title: D. Happy New Year 2023 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-05 04:03:00 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/38636583 ) 

open Core
open IterLabels

let t = Scanf.scanf " %d" Fn.id

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

let calc n =
  let i =
    2 -- int_of_num (n /// Int 2)
    |> find_pred_exn ~f:(fun i -> mod_num n (Int i) =/ Int 0)
  in
  if n %/ (Int i */ Int i) =/ Int 0
  then (
    let p = Int i in
    let q = n /// p /// p in
    p, q)
  else (
    let q = Int i in
    let p = Int.of_float (Float.sqrt (Float.of_int @@ int_of_num (n /// q))) in
    Int p,  q)
;;

let () =
  for _ = 1 to t do
    let n = Scanf.scanf " %s" Num.num_of_string in
    let p, q = calc n in
    printf "%s %s\n" (string_of_num p) (string_of_num q)
  done
;;
