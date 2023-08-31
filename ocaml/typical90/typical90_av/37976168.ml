//##// Contest ID: typical90
//##// Problem ID: typical90_av ( https://atcoder.jp/contests/typical90/tasks/typical90_av )
//##// Title: 048. I will not drop out（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-13 08:11:22 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37976168 ) 

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

let nn, kk = si2 ()

let () =
  1 -- nn
  >|= (fun _ ->
        let a, b = si2 () in
        doubleton (a - b) b)
  |> concat
  |> sort ~cmp:(fun x y -> -Int.compare x y)
  |> take kk |> sum |> pi
