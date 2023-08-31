//##// Contest ID: typical90
//##// Problem ID: typical90_ax ( https://atcoder.jp/contests/typical90/tasks/typical90_ax )
//##// Title: 050. Stair Jump（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-13 08:21:24 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37976326 ) 

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

let nn, ll = si2 ()
let cache = Hashtbl.create (module Int)

let rec cnt x =
  Hashtbl.find_or_add cache x ~default:(function () ->
      (match x with
      | 0 -> 1
      | n when n >= ll -> (cnt (n - 1) + cnt (n - ll)) % 1_000_000_007
      | n -> cnt (n - 1)))

let () = pi @@ cnt nn
