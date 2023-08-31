//##// Contest ID: typical90
//##// Problem ID: typical90_bu ( https://atcoder.jp/contests/typical90/tasks/typical90_bu )
//##// Title: 073. We Need Both a and b（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-25 07:23:58 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38315304 ) 

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

  module Mod = struct
    let m = 1_000_000_007
    let mm x = x % m
    let ( + ) x y = mm x + mm y |> mm
    let ( - ) x y = mm (m + mm (mm x - mm y))
    let ( * ) x y = mm (mm x * mm y)
  end
end

open M
open M.Num
open IterLabels

(************)
open Mod
let nn = si ()
let cc = Array.init nn ~f:sc
let ab = Array.init (nn - 1) ~f:si2
let graph = Array.create ~len:(nn + 1) []

let () =
  (0 -- (nn - 2)) (fun i ->
      let a, b = ab.(i) in
      graph.(a) <- b :: graph.(a);
      graph.(b) <- a :: graph.(b))

let dp = Array.make_matrix ~dimx:(nn + 1) ~dimy:3 0

let rec dfs pre p =
  let val1, val2 =
    graph.(p)
    |> List.fold ~init:(1, 1) ~f:(fun (val1, val2) x ->
           if x = pre then (val1, val2)
           else (
             dfs p x;
             let val1 =
               if Char.(cc.(p - 1) = 'a') then val1 * (dp.(x).(0) + dp.(x).(2))
               else val1 * (dp.(x).(1) + dp.(x).(2))
             in
             let val2 = val2 * (dp.(x).(0) + dp.(x).(1) + (2 * dp.(x).(2))) in
             (val1, val2)))
  in
  if Char.(cc.(p - 1) = 'a') then dp.(p).(0) <- val1 else dp.(p).(1) <- val1;
  dp.(p).(2) <- mm @@ val2 - val1

let () =
  dfs (-1) 1;
  pi @@ dp.(1).(2)