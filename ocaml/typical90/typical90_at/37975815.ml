//##// Contest ID: typical90
//##// Problem ID: typical90_at ( https://atcoder.jp/contests/typical90/tasks/typical90_at )
//##// Title: 046. I Love 46（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-13 07:52:49 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37975815 ) 

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
let nn = si ()
let mm x = x % 46
let aa = 1 -- nn >|= si >|= mm |> count |> persistent
let bb = 1 -- nn >|= si >|= mm |> count |> persistent
let cc = 1 -- nn >|= si >|= mm |> count |> persistent

let () =
  aa
  >|= (fun (a, ac) ->
        bb
        >|= (fun (b, bc) ->
              cc
              >|= (fun (c, cc) ->
                    if mm (a + b + c) = 0 then ac * bc * cc else 0)
              |> sum)
        |> sum)
  |> sum |> pi
