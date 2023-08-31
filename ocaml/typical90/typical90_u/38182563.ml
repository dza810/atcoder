//##// Contest ID: typical90
//##// Problem ID: typical90_u ( https://atcoder.jp/contests/typical90/tasks/typical90_u )
//##// Title: 021. Come Back in One Piece（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-21 05:45:36 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38182563 ) 

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
open IterLabels

(************)
let nn, mm = si2 ()
let g = Array.create ~len:(nn + 1) []
let h = Array.create ~len:(nn + 1) []

let () =
  (1 -- mm) (fun _ ->
      let a, b = si2 () in
      g.(a) <- b :: g.(a);
      h.(b) <- a :: h.(b))

let visited = Array.create ~len:(nn + 1) false

let rec dfs ~visited (graph : 'a list array) acc x ~f =
  if visited.(x) then acc
  else (
    visited.(x) <- true;
    f x (graph.(x) |> List.fold ~init:acc ~f:(dfs ~visited graph ~f)))

let visited = Array.create ~len:(nn + 1) false
let dfs1 = dfs ~visited g ~f:List.cons
let visited = Array.create ~len:(nn + 1) false
let dfs2 = dfs ~visited h ~f:(fun _ acc -> acc + 1)

let () =
  let order = 1 -- nn |> fold ~init:[] ~f:dfs1 in
  order |> of_list
  |> map ~f:(dfs2 0)
  |> map ~f:(fun v ->
         v)
  |> map ~f:(fun cnt -> cnt * (cnt - 1) / 2)
  |> sum |> pi
