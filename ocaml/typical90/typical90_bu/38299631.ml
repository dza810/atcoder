//##// Contest ID: typical90
//##// Problem ID: typical90_bu ( https://atcoder.jp/contests/typical90/tasks/typical90_bu )
//##// Title: 073. We Need Both a and b（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-24 08:52:21 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38299631 ) 

open Core
open Printf
open Scanf
open IterLabels
open Num

let m = 1_000_000_007
let mm x = ((x % m) + m) % m
let nn = scanf " %d" Fn.id
let cc = Array.init nn ~f:(fun _ -> scanf " %c" Fn.id)
let graph = Array.create ~len:(nn + 1) []
let ab = Array.init (nn - 1) ~f:(fun _ -> scanf " %d %d" (fun x y -> (x, y)))

let () =
  (1 -- (nn - 1)) (fun i ->
      let a, b = ab.(i - 1) in
      graph.(a) <- b :: graph.(a);
      graph.(b) <- a :: graph.(b))

let dp = Array.make_matrix ~dimx:(nn + 1) ~dimy:3 0

let rec dfs pre p =
  let val1, val2 =
    graph.(p)
    |> List.fold ~init:(1, 1) ~f:(fun (val1, val2) i ->
           if i = pre then (val1, val2)
           else (
             dfs p i;
             if Char.(cc.(p - 1) = 'a') then
               ( mm @@ (val1 * (dp.(i).(0) + dp.(i).(2))),
                 mm @@ (val2 * (dp.(i).(0) + dp.(i).(1) + (2 * dp.(i).(2)))) )
             else
               ( mm @@ (val1 * (dp.(i).(1) + dp.(i).(2))),
                 mm @@ (val2 * (dp.(i).(0) + dp.(i).(1) + (2 * dp.(i).(2)))) )))
  in
  if Char.(cc.(p - 1) = 'a') then (
    dp.(p).(0) <- val1;
    dp.(p).(2) <- mm @@ (val2 - val1))
  else (
    dp.(p).(1) <- val1;
    dp.(p).(2) <- mm @@ (val2 - val1))

let () =
  dfs (-1) 1;
  dp.(1).(2) |> printf "%d\n"

  