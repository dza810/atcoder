//##// Contest ID: typical90
//##// Problem ID: typical90_bo ( https://atcoder.jp/contests/typical90/tasks/typical90_bo )
//##// Title: 067. Base 8 to 9（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 12:04:01 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37905373 ) 

open Core
open Printf
open Num
open Scanf
open IterLabels

module Int = struct
  let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

  include Int
end

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let ss _ = scanf " %c" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi ?(list = false) x = if list then printf " %d;" x else printf "%d\n" x
let ps ?(list = false) x = if list then printf " %s;" x else printf "%s\n" x

let pl ~p l =
  printf "[";
  List.iter l ~f:(fun x -> p ~list:true x);
  print_endline "]"

let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2
(************)

let rec _to8 li x =
  if x =/ zero then li
  else _to8 ((x %/ i2n 10) :: li) (floor_num @@ (x // i2n 10))

let rec base8_int = List.fold ~init:zero ~f:(fun acc x -> (acc */ i2n 8) +/ x)

let rec int_base9 li x =
  if x =/ zero then li
  else int_base9 ((x %/ i2n 9) :: li) (floor_num (x // i2n 9))

let main x =
  let x = base8_int x in
  let x = int_base9 [] x in
  x |> List.map ~f:(fun x -> if x =/ i2n 8 then i2n 5 else x)

let rec loop i x = if i = 0 then x else loop (i - 1) (main x)
let nn = sn () |> _to8 []
let kk = si ()

let () =
  let x = loop kk nn in
  if List.length x = 0 then pi 0
  else x |> List.map ~f:string_of_num |> String.concat |> print_endline
