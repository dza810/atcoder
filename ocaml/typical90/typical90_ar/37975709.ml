//##// Contest ID: typical90
//##// Problem ID: typical90_ar ( https://atcoder.jp/contests/typical90/tasks/typical90_ar )
//##// Title: 044. Shift and Swapping（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-13 07:48:01 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37975709 ) 

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

let swap lshift x y =
  let x, y = ((x - 1 - lshift) % nn, (y - 1 - lshift) % nn) in
  let t = aa.(x) in
  aa.(x) <- aa.(y);
  aa.(y) <- t

let () =
  1 -- qq
  |> fold ~init:0 ~f:(fun lshift _ ->
         let t, x, y = si3 () in
         match t with
         | 1 ->
             swap lshift x y;
             lshift
         | 2 -> lshift + 1
         | 3 ->
             pi @@ aa.((x - 1 - lshift) % nn);
             lshift
         | _ -> failwith "")
  |> ignore
