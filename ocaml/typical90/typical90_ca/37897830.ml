//##// Contest ID: typical90
//##// Problem ID: typical90_ca ( https://atcoder.jp/contests/typical90/tasks/typical90_ca )
//##// Title: 079. Two by Two（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 06:04:59 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37897830 ) 

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

(************)
let hh, ww = si2 ()
let aa = Array.init hh ~f:(fun _ -> Array.init ww ~f:(fun _ -> si ()))
let bb = Array.init hh ~f:(fun _ -> Array.init ww ~f:(fun _ -> si ()))

let cc =
  Array.init hh ~f:(fun h ->
      Array.init ww ~f:(fun w -> aa.(h).(w) - bb.(h).(w)))

let () =
  let ans = ref 0 in
  for h = 0 to hh - 1 do
    for w = 0 to ww - 1 do
      let x = cc.(h).(w) in
      if x <> 0 && 0 <= h && h < hh - 1 && 0 <= w && w < ww - 1 then
        let () = ans := Int.abs x + !ans in
        let d = [ (0, 0); (0, 1); (1, 0); (1, 1) ] in
        List.iter d ~f:(fun (dh, dw) ->
            if
              0 <= h + dh && h + dh <= hh - 1 && 0 <= w + dw && w + dw <= ww - 1
            then cc.(h + dh).(w + dw) <- cc.(h + dh).(w + dw) - x)
    done
  done;
  match
    0 -- (hh - 1)
    |> find (fun h ->
           0 -- (ww - 1)
           |> find (fun w -> if cc.(h).(w) <> 0 then Some false else None))
  with
  | Some _ -> printf "No\n"
  | None -> printf "Yes\n%d\n" !ans
