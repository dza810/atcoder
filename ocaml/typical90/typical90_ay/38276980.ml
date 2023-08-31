//##// Contest ID: typical90
//##// Problem ID: typical90_ay ( https://atcoder.jp/contests/typical90/tasks/typical90_ay )
//##// Title: 051. Typical Shop（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-23 04:49:50 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38276980 ) 

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
end

open M
open M.Num
open IterLabels

(************)

let n = si ()
let k = si ()
let p = sn ()
let a = Array.init n ~f:sn
let mid = n / 2
let vec1 = Array.create ~len:(n + 1) []
let vec2 = Array.create ~len:(n + 1) []

let () =
     for i = 0 to 1 lsl mid - 1 do
       let k, sum =
         0 -- (mid - 1)
         |> filter ~f:(fun j -> i land (1 lsl j) > 0)
         |> fold ~init:(0, Int 0) ~f:(fun (k, sum) j -> (k + 1, sum +/ a.(j)))
       in
       if sum <=/ p then vec1.(k) <- sum :: vec1.(k)
     done

   let () =
     for i = 0 to 1 lsl (n - mid) - 1 do
       let k, sum =
         0 -- (n - mid - 1)
         |> filter ~f:(fun j -> i land (1 lsl j) > 0)
         |> fold ~init:(0, Int 0) ~f:(fun (k, sum) j ->
                (k + 1, sum +/ a.(j + mid)))
       in
       if sum <=/ p then vec2.(k) <- sum :: vec2.(k)
     done

let rec bin_search f l r =
  if r - l <= 1 then l
  else
    let c = ((r - l) / 2) + l in
    if f c then bin_search f c r else bin_search f l c

let vec1 =
  Array.map vec1 ~f:(fun l ->
      let l = Array.of_list l in
      (* Array.sort ~compare:compare_num l; *)
      l)

let vec2 =
  Array.map vec2 ~f:(fun l ->
      let l = Array.of_list l in
      Array.sort ~compare:compare_num l;
      l)

let () =
  0 -- k
  |> fold ~init:0 ~f:(fun acc h ->
         acc
         + Array.fold vec1.(h) ~init:0 ~f:(fun acc ii ->
               let pos =
                 bin_search
                   (fun c -> vec2.(k - h).(c) <=/ p -/ ii)
                   (-1)
                   (Array.length vec2.(k - h))
               in
               pos + acc + 1))
  |> pi
