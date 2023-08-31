//##// Contest ID: typical90
//##// Problem ID: typical90_bo ( https://atcoder.jp/contests/typical90/tasks/typical90_bo )
//##// Title: 067. Base 8 to 9（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-14 06:03:59 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37994725 ) 

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

module Num = struct
  include Num

  let sn _ = Scanf.scanf " %s" num_of_string
  let ( %/ ) x y = mod_num x y
  let i2n = num_of_int
  let zero = num_of_int 0
  let one = num_of_int 1
  let two = num_of_int 2
end

open Num

(* open IterLabels.Infix *)
open IterLabels

(************)

let _to8 x =
  let rec aux l x =
    if x =/ zero then l else aux ((x %/ i2n 10) :: l) (floor_num @@ (x // i2n 10))
  in
  aux [] x

let _8to10 = List.fold ~init:zero ~f:(fun acc x -> (floor_num @@ acc */ i2n 8) +/ x)

let _10to9 x =
  let rec aux l x =
    if x =/ zero then l else aux ((x %/ i2n 9) :: l) (floor_num @@ (x // i2n 9))
  in
  aux [] x

let rec loop i x =
  if i = 0 then x
  else
    let x = _8to10 x in
    let x = _10to9 x in
    loop (i - 1) @@ List.map x ~f:(fun x -> if x =/ i2n 8 then i2n 5 else x)

let nn = sn ()
let kk = si ()

let () =
  let x = loop kk (_to8 nn) in
  match x with
  | [] -> ps "0"
  | x -> x |> List.map ~f:string_of_num |> String.concat |> ps
