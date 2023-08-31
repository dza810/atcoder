//##// Contest ID: typical90
//##// Problem ID: typical90_bt ( https://atcoder.jp/contests/typical90/tasks/typical90_bt )
//##// Title: 072. Loop Railway Plan（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 10:37:30 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37903586 ) 

open Core
open Printf
open Num
open Scanf
open IterLabels

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi x = printf "%d\n" x
let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2
(************)

let hh, ww = si2 ()
let arr = Array.init hh ~f:(fun _ -> Array.init ww ~f:(fun _ -> sc ()))
let visited = Array.make_matrix ~dimx:hh ~dimy:ww false

let rec loop len (sh, sw) (h, w) =
  if visited.(h).(w) then if sh = h && sw = w then len else -1
  else (
    visited.(h).(w) <- true;
    let d = [ (1, 0); (-1, 0); (0, 1); (0, -1) ] in
    let x =
      List.map d ~f:(fun (dh, dw) ->
          let h, w = (h + dh, w + dw) in
          if 0 <= h && h < hh && 0 <= w && w < ww && Char.(arr.(h).(w) = '.')
          then loop (len + 1) (sh, sw) (h, w)
          else -1)
      |> List.fold ~init:(-1) ~f:Int.max
    in
    visited.(h).(w) <- false;
    x)

let () =
  let x = 0 -- (hh - 1)
  |> fold ~init:(-1) ~f:(fun acc h ->
         0 -- (ww - 1)
         |> fold ~init:acc ~f:(fun acc w -> Int.max acc (loop 0 (h, w) (h, w))))
  in
  pi @@ if x > 3 then x else (-1)
 