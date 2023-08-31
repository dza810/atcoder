//##// Contest ID: typical90
//##// Problem ID: typical90_bd ( https://atcoder.jp/contests/typical90/tasks/typical90_bd )
//##// Title: 056. Lucky Bag（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-23 05:30:56 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38277572 ) 

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

    let rec log10_num ?(ans = 0) x =
      if x =/ Int 0 then ans - 1 else log10_num ~ans:(ans + 1) (x /// Int 10)

    let rec power_num ~mm v a x =
      if x =/ Int 0 then v
      else if x %/ Int 2 =/ Int 0 then
        power_num ~mm v (mm @@ (a */ a)) (x /// Int 2)
      else power_num ~mm (mm @@ (a */ v)) (mm @@ (a */ a)) (x /// Int 2)
  end
end

open M
open M.Num
open IterLabels

(************)

let nn, ss = si2 ()
let tbl = Array.make_matrix ~dimx:(nn + 1) ~dimy:1_000_000 false
let () = tbl.(0).(0) <- true
let ab = Array.init nn ~f:si2

let () =
  1 -- nn
  |> iter ~f:(fun n ->
         let a, b = ab.(n - 1) in
         0 -- ss
         |> iter ~f:(fun s ->
                if s - a >= 0 then tbl.(n).(s) <- tbl.(n - 1).(s - a);
                if s - b >= 0 then
                  tbl.(n).(s) <- tbl.(n).(s) || tbl.(n - 1).(s - b)))

let () =
  if tbl.(nn).(ss) then
    nn --^ 1
    |> fold ~init:([], ss) ~f:(fun (rt, ss) n ->
           let a, b = ab.(n - 1) in
           if ss >= a && tbl.(n - 1).(ss - a) then ("A" :: rt, ss - a)
           else ("B" :: rt, ss - b))
    |> fst |> String.concat |> ps
  else ps "Impossible"
