//##// Contest ID: abs
//##// Problem ID: abc088_b ( https://atcoder.jp/contests/abs/tasks/abc088_b )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 02:59:33 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32526390 ) 

open Core
open Num

let id x = x
let inf = Int.max_value
let si _ = Scanf.scanf " %d" id
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f


module C = Array
let ( -- ) s e = C.init (e - s) ~f:(( + ) s)

let ( >>| ) x f = C.map ~f x
let ( >|| ) x f = C.iter ~f x
(* let ( >>= ) x f = C.bind ~f x *)

let fold f init x = C.fold ~f ~init x

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

(************)
let nn = si ()

let aa = 
  let x = ((0 -- nn) >>| si) in
  x |> C.sorted_copy ~compare:(fun x y -> Int.compare y x)
;;

let () =
  let alice, bob = aa |> C.foldi ~init:(0,0) ~f:(fun i (alice, bob) x -> if i mod 2 = 0 then (alice + x, bob) else (alice, bob+x) ) in
  alice - bob |> pi