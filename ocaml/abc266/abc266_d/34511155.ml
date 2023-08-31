//##// Contest ID: abc266
//##// Problem ID: abc266_d ( https://atcoder.jp/contests/abc266/tasks/abc266_d )
//##// Title: D. Snuke Panic (1D)
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 11:30:34 +0000 UTC ( https://atcoder.jp/contests/abc266/submissions/34511155 ) 

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
let txatmp = Array.init nn ~f:si3
let tt = fst3 txatmp.(nn - 1)
let txa = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))

let () =
  txatmp |> Array.iter ~f:(fun (t, x, a) -> Hashtbl.add_exn txa ~key:(x, t) ~data:a)
;;

let dptbl = Array.make_matrix ~dimx:5 ~dimy:100_100 None

let rec dp x t =
  if x <> 0 && t = 0 then 0 else
  if x > t then 0 else
  if t < 0 then 0 else
  match dptbl.(x).(t) with
  | Some x -> x
  | None ->
    let v = dp x (t - 1) in
    let v = Int.max v @@ if x = 4 then 0 else dp (x + 1) (t - 1) in
    let v = Int.max v @@ if x = 0 then 0 else dp (x - 1) (t - 1) in
    let v = v + (Hashtbl.find txa (x, t) |> Option.value ~default:0) in
    dptbl.(x).(t) <- Some v;
    v
;;

let () = 0 -- 4 >|= (fun x -> dp x tt) |> max |> Option.value ~default:0 |> pi
