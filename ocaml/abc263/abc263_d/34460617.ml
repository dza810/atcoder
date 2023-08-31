//##// Contest ID: abc263
//##// Problem ID: abc263_d ( https://atcoder.jp/contests/abc263/tasks/abc263_d )
//##// Title: D. Left Right Operation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-30 12:10:15 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34460617 ) 

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
let aa = List.init nn ~f:si |> List.rev
let bb =
  aa
  |> List.folding_map ~init:0 ~f:(fun acc x ->
         let v = acc + x in
         v, v)
;;

let bb = 0 :: bb

let cc =
  bb
  |> List.mapi ~f:(fun i x -> x - (rr * i))
  |> List.rev
  |> List.folding_map ~init:Int.max_value ~f:(fun acc x ->
         let v = Int.min acc x in
         v, v)
  |> List.rev
;;

let dd =
  List.map3_exn
    (List.init (nn + 1) ~f:(fun i -> i))
    bb
    cc
    ~f:(fun i b c -> (ll * i) - b + c)
;;

let () =
  let v = dd |> List.fold ~init:Int.max_value ~f:Int.min in
  pi @@ ((rr * nn) + v)
;;
