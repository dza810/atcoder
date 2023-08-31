//##// Contest ID: typical90
//##// Problem ID: typical90_az ( https://atcoder.jp/contests/typical90/tasks/typical90_az )
//##// Title: 052. Dice Product（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-13 08:31:26 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37976503 ) 

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
let mm x = x % 1_000_000_007
let nn = si ()

let () =
  1 -- nn
  >|= (fun _ -> 1 -- 6 >|= si |> sum )
  |> fold ~init:1 ~f:(fun acc x -> mm (acc * x))
  |> pi
