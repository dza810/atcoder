//##// Contest ID: typical90
//##// Problem ID: typical90_ca ( https://atcoder.jp/contests/typical90/tasks/typical90_ca )
//##// Title: 079. Two by Two（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 08:03:37 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37998074 ) 

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

let hh, ww = si2 ()
let aa = Array.init hh ~f:(fun _ -> Array.init ww ~f:si)
let bb = Array.init hh ~f:(fun _ -> Array.init ww ~f:si)
let cc = Array.map2_exn bb aa ~f:(Array.map2_exn ~f:( - ))

let () =
  let v =
    0 -- (hh - 2)
    |> fold ~init:0 ~f:(fun ans h ->
           0 -- (ww - 2)
           |> fold ~init:ans ~f:(fun ans w ->
                  let v = cc.(h).(w) in
                  [ (0, 0); (0, 1); (1, 0); (1, 1) ]
                  |> List.iter ~f:(fun (dh, dw) ->
                         let h, w = (h + dh, w + dw) in
                         cc.(h).(w) <- cc.(h).(w) - v);
                  ans + Int.abs v))
  in
  if Array.for_all ~f:(Array.for_all ~f:(( = ) 0)) cc then (
    ps "Yes";
    pi v)
  else ps "No"
