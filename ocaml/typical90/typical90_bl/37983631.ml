//##// Contest ID: typical90
//##// Problem ID: typical90_bl ( https://atcoder.jp/contests/typical90/tasks/typical90_bl )
//##// Title: 064. Uplift（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-13 14:33:41 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37983631 ) 

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

(* open IterLabels.Infix *)
open IterLabels

(************)

let nn, qq = si2 ()
let aa = Array.init nn ~f:si
let aa = Array.init (nn - 1) ~f:(fun i -> aa.(i + 1) - aa.(i))
let sss = aa |> Array.map ~f:Int.abs |> Array.fold ~init:0 ~f:( + )

let () =
  1 -- qq
  |> fold ~init:sss ~f:(fun sss _ ->
         let l, r, v = si3 () in
         let l, r = (l - 1, r - 1) in
         let sss =
           sss
           + (if l - 1 >= 0 then (
              let vv = -Int.abs aa.(l - 1) + Int.abs (aa.(l - 1) + v) in
              aa.(l - 1) <- aa.(l - 1) + v;
              vv)
             else 0)
           +
           if r < nn - 1 then (
             let vv = -Int.abs aa.(r) + Int.abs (aa.(r) - v) in
             aa.(r) <- aa.(r) - v;
             vv)
           else 0
         in
         pi sss;
         sss)
  |> ignore
