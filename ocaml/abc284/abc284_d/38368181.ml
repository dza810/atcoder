//##// Contest ID: abc284
//##// Problem ID: abc284_d ( https://atcoder.jp/contests/abc284/tasks/abc284_d )
//##// Title: D. Happy New Year 2023 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-28 07:02:26 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/38368181 ) 

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

let primes = Array.create ~len:2_100_000 true
let () = primes.(0) <- false
let () = primes.(1) <- false

let rec loop i k =
  if i >= 2_100_000
  then ()
  else (
    primes.(i) <- false;
    loop (i + k) k)
;;

let () = (2 -- 2_099_999) (fun i -> if primes.(i) then loop (i + i) i)

let primes =
  primes
  |> Array.foldi ~init:[] ~f:(fun i acc v -> if v then i :: acc else acc)
  |> List.rev
;;

let tt = Scanf.scanf " %d" Fn.id

let rec calc (n : num) = function
  | [] -> failwith "never"
  | i :: primes ->
    let i = Int i in
    if i */ i */ i >/ n
    then failwith "never"
    else if n %/ i <>/ Int 0
    then calc n primes
    else if n /// i %/ i =/ Int 0
    then (
      let p = i in
      let q = n /// i /// i in
      p, q)
    else (
      let q = i in
      let p = Int (Int.of_float (Float.sqrt (float_of_num (n /// q)))) in
      p, q)
;;

let () =
  for _ = 1 to tt do
    let n = Scanf.scanf " %s" Num.num_of_string in
    let p, q = calc n primes in
    Printf.printf "%s %s\n" (string_of_num p) (string_of_num q)
  done
;;
