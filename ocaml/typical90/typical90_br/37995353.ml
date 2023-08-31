//##// Contest ID: typical90
//##// Problem ID: typical90_br ( https://atcoder.jp/contests/typical90/tasks/typical90_br )
//##// Title: 070. Plant Planning（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 06:30:24 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37995353 ) 

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

let nn = si ()
let xy = Array.init nn ~f:si2
let xx = xy |> Array.map ~f:fst
let yy = xy |> Array.map ~f:snd

let () =
  Array.sort xx ~compare:Int.compare;
  Array.sort yy ~compare:Int.compare

let () =
  let x, y = (xx.(nn / 2), yy.(nn / 2)) in
  let sx =
    xx |> Array.map ~f:(fun v -> Int.abs (x - v)) |> Array.fold ~init:0 ~f:( + )
  in
  let sy =
    yy |> Array.map ~f:(fun v -> Int.abs (y - v)) |> Array.fold ~init:0 ~f:( + )
  in
  pi @@ (sx + sy)
