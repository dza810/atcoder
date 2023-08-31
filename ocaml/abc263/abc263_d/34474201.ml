//##// Contest ID: abc263
//##// Problem ID: abc263_d ( https://atcoder.jp/contests/abc263/tasks/abc263_d )
//##// Title: D. Left Right Operation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-31 08:45:10 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34474201 ) 

open Core
open Printf

(* open Num *)
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

(************)
let nn = si ()
let ll = si ()
let rr = si ()
let aa = 0 :: (List.init nn ~f:si |> List.rev) |> Array.of_list
let ftbl = Hashtbl.create (module Int)
let gtbl = Hashtbl.create (module Int)

let rec f k =
  Hashtbl.find_or_add ftbl k ~default:(fun () ->
      if k = 0
      then 0
      else (
        let v1 = f (k - 1) + aa.(k) in
        let v2 = ll * k in
        Int.min v1 v2))
;;

let rec g k =
  Hashtbl.find_or_add gtbl k ~default:(fun () ->
      if k = 0
      then 0
      else (
        let v1 = g (k - 1) + aa.(nn - k + 1) in
        let v2 = rr * k in
        Int.min v1 v2))
;;

let () =
  let v = 0 -- nn |> map ~f:(fun i -> f i + g (nn - i)) |> min in
  pi @@ Option.value_exn v
;;
