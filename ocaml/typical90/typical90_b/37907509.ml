//##// Contest ID: typical90
//##// Problem ID: typical90_b ( https://atcoder.jp/contests/typical90/tasks/typical90_b )
//##// Title: 002. Encyclopedia of Parentheses（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 13:24:10 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37907509 ) 

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

let pa ~p l =
  printf "[";
  Array.iter l ~f:(fun x -> p ?list:(Some true) x);
  print_endline "]"

let pl ~p l =
  printf "[";
  List.iter l ~f:(fun x -> p ?list:(Some true) x);
  print_endline "]"

let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2

(************)
let nn = si ()

let () =
  let rec loop left right j =
    if j = 0 && left + right = nn then `Ok
    else
      let left, right =
        if j % 2 = 1 then (left + 1, right) else (left, right + 1)
      in
      if left >= right && left <= nn / 2 then loop left right (j / 2) else `Ng
  in
  let rec pp ?(k = nn) ?(li=[]) j =
    if k = 0 then li |> String.of_char_list |> ps
    else 
    pp ~k:(k - 1) ~li:((if j % 2 = 1 then ')' else '(')::li) (j / 2)
  in

  for i = 0 to (1 lsl nn) - 1 do
    match loop 0 0 i with `Ok -> pp i | `Ng -> ()
  done