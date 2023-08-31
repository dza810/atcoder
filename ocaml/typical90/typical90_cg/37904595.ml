//##// Contest ID: typical90
//##// Problem ID: typical90_cg ( https://atcoder.jp/contests/typical90/tasks/typical90_cg )
//##// Title: 085. Multiplication 085（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-09 11:30:08 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37904595 ) 

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
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi x = printf "%d\n" x
let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2
(************)

let kk = si ()

let divs =
  List.init (Int.sqrt kk) ~f:Int.succ |> List.filter ~f:(fun x -> kk % x = 0)

let rec loop_b v = function
  | [] -> 0
  | x :: xs -> (if v % x = 0 && v / x >= x then 1 else 0) + loop_b v xs

let rec loop_a v = function
  | [] -> 0
  | x :: xs as l -> (if v % x = 0 then loop_b (v / x) l  else 0 )+ loop_a v xs

let () =
  loop_a kk divs |> pi