//##// Contest ID: typical90
//##// Problem ID: typical90_bz ( https://atcoder.jp/contests/typical90/tasks/typical90_bz )
//##// Title: 078. Easy Graph Problem（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 07:50:34 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37997726 ) 

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

let nn, mm = si2 ()

let cnt = Hashtbl.create (module Int)

let () =
  1 -- mm |> iter ~f:(fun _ ->
    let a,b = si2 () in
    if a <> b then Hashtbl.update cnt (Int.max a b) ~f:(Option.value_map ~default:1 ~f:Int.succ)
    )

let () =
  pi @@ Hashtbl.fold cnt ~init:0 ~f:(fun ~key ~data c -> if data = 1 then Int.succ c else c)
