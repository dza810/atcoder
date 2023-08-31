//##// Contest ID: typical90
//##// Problem ID: typical90_c ( https://atcoder.jp/contests/typical90/tasks/typical90_c )
//##// Title: 003. Longest Circular Road（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-25 13:40:06 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38322269 ) 

open Printf
open Core

module M = struct
  open Scanf

  let ( @. ) f g x = f (g x)

  module Int = struct
    let sqrt = Int.of_float @. Float.sqrt @. Float.of_int

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

  module Num = struct
    include Num

    let sn _ = Scanf.scanf " %s" num_of_string
    let ( %/ ) x y = mod_num x y
    let ( /// ) x y = floor_num @@ (x // y)

    let rec log10_num ?(ans = 0) x =
      if x =/ Int 0 then ans - 1 else log10_num ~ans:(ans + 1) (x /// Int 10)

    let rec power_num ~mm v a x =
      if x =/ Int 0 then v
      else if x %/ Int 2 =/ Int 0 then
        power_num ~mm v (mm @@ (a */ a)) (x /// Int 2)
      else power_num ~mm (mm @@ (a */ v)) (mm @@ (a */ a)) (x /// Int 2)
  end

  module Mod = struct
    let m = 1_000_000_007
    let mm x = x % m
    let ( + ) x y = mm x + mm y |> mm
    let ( - ) x y = mm (m + mm (mm x - mm y))
    let ( * ) x y = mm (mm x * mm y)
  end
end

open M
open M.Num
open IterLabels

(************)

let nn = si ()
let graph = Array.create ~len:(nn + 1) []

let () =
  (1 -- (nn - 1)) (fun _ ->
      let a, b = si2 () in
      graph.(a) <- b :: graph.(a);
      graph.(b) <- a :: graph.(b))

let rec dfs len pre p =
    match graph.(p)
    |> List.filter ~f:(( <> ) pre)
    |> List.map ~f:(dfs (len + 1) p)
    |> List.reduce ~f:(fun x y -> if (snd x) > (snd y) then x else y) with
  | Some v -> v
  | None -> (p, len + 1)
;;
let () =
  let p, _ = dfs 0 (-1) 1 in
  let _, l = dfs 0 (-1) p in
  pi l
