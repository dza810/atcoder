//##// Contest ID: typical90
//##// Problem ID: typical90_bt ( https://atcoder.jp/contests/typical90/tasks/typical90_bt )
//##// Title: 072. Loop Railway Plan（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 07:03:53 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37996254 ) 

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

let hh, ww = si2 ()
let cc = Array.init hh ~f:(fun _ -> Array.init ww ~f:(fun _ -> sc ()))

let rec dfs visited len s (px, py) =
  if 0 <= px && px < hh && 0 <= py && py < ww && Char.(cc.(px).(py) = '.') then
    if List.mem ~equal:Poly.equal visited (px, py) then
      if Poly.(s = (px, py)) then Some len else None
    else
      let visited = (px, py) :: visited in
      let x =
        [ (1, 0); (-1, 0); (0, 1); (0, -1) ]
        |> List.map ~f:(fun (dx, dy) -> (px + dx, py + dy))
        |> List.map ~f:(fun (qx, qy) -> dfs visited (len + 1) s (qx, qy))
        |> List.filter_opt
        |> List.fold ~init:0 ~f:Int.max
      in
      Some x
  else None

let () =
  let v =
    0 -- (hh - 1)
    >|= (fun h -> 0 -- (ww - 1) >|= fun w -> dfs [] 0 (h, w) (h, w))
    |> concat |> filter_map ~f:id
    |> filter ~f:(fun x -> x >= 3)
    |> max
  in
  match v with Some v -> pi v | None -> pi (-1)
