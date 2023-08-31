//##// Contest ID: abc286
//##// Problem ID: abc286_d ( https://atcoder.jp/contests/abc286/tasks/abc286_d )
//##// Title: D. Money in Hand
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-21 13:47:03 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38228494 ) 

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
    let i2n = num_of_int
    let zero = num_of_int 0
    let one = num_of_int 1
    let two = num_of_int 2

    let rec log10_num ?(ans = 0) x =
      if x =/ zero then ans - 1 else log10_num ~ans:(ans + 1) (x /// i2n 10)

    let rec power_num ~mm v a x =
      if x =/ zero then v
      else if x %/ two =/ zero then power_num ~mm v (mm @@ (a */ a)) (x /// two)
      else power_num ~mm (mm @@ (a */ v)) (mm @@ (a */ a)) (x /// two)
  end
end

open M
open M.Num

(* open IterLabels.Infix *)
open IterLabels

(************)
let nn, xx = si2 ()
let ab = Array.init nn ~f:si2
let tbl = Array.make_matrix ~dimx:51 ~dimy:10_100 None

let rec dp i j =
  if i = -1 then j = 0
  else
    match tbl.(i).(j) with
    | Some v -> v
    | None ->
        let v =
          let a, b = ab.(i) in
          0 -- b
          |> fold_while ~init:false ~f:(fun _ bb ->
                 let jj = j - (a * bb) in
                 if jj >= 0 then
                   if dp (i - 1) jj then (true, `Stop) else (false, `Continue)
                 else (false, `Continue))
        in
        tbl.(i).(j) <- Some v;
        v

let () = ps @@ if dp (nn - 1) xx then "Yes" else "No"
