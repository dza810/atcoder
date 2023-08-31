//##// Contest ID: typical90
//##// Problem ID: typical90_bk ( https://atcoder.jp/contests/typical90/tasks/typical90_bk )
//##// Title: 063. Monochromatic Subgrid（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-24 03:36:40 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38294537 ) 

open Core
open Printf
open Scanf
open IterLabels

let hh, ww = scanf " %d %d" (fun x y -> (x, y))

let p =
  Array.init hh ~f:(fun _ -> Array.init ww ~f:(fun _ -> scanf " %d" Fn.id))

let check hs : int =
  let tbl = Hashtbl.create (module Int) in
  0 -- (ww - 1)
  |> iter ~f:(fun w ->
         let v = p.(hs.(0)).(w) in
         if hs |> Array.for_all ~f:(fun h -> p.(h).(w) = v) then
           Hashtbl.update tbl v
             ~f:(Option.value_map ~default:1 ~f:(fun x -> x + 1)));
  Hashtbl.fold tbl ~init:0 ~f:(fun ~key ~data acc -> Int.max data acc)
  * Array.length hs

let () =
  1 -- ((1 lsl hh) - 1)
  |> map ~f:(fun h ->
         0 -- (hh - 1)
         |> filter ~f:(fun i -> h land (1 lsl i) > 0)
         |> to_array |> check)
  |> max_exn ?lt:None |> printf "%d\n"
