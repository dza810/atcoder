//##// Contest ID: abc284
//##// Problem ID: abc284_c ( https://atcoder.jp/contests/abc284/tasks/abc284_c )
//##// Title: C. Count Connected Components
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-22 10:19:59 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/38249711 ) 

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

let nn, mm = si2 ()
let _par = Array.init nn ~f:id

let rec par i =
  if _par.(i) = i then i
  else (
    _par.(i) <- par _par.(i);
    _par.(i))

let join i j =
  let i = par i in
  let j = par j in
  _par.(i) <- _par.(j)

let () =
  for _ = 1 to mm do
    let u, v = si2 () in
    let u, v = (u - 1, v - 1) in
    join u v
  done;
  for i = 0 to nn - 1 do
    ignore @@ par i
  done;
  let flg = Array.create ~len:nn false in
  Array.iter _par ~f:(fun v -> flg.(v) <- true);
  pi @@ (Array.count ~f:id flg)