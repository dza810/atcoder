//##// Contest ID: abc263
//##// Problem ID: abc263_d ( https://atcoder.jp/contests/abc263/tasks/abc263_d )
//##// Title: D. Left Right Operation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-31 09:12:34 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34474682 ) 

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
let dptbl = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))

let rec dp p t =
  Hashtbl.find_or_add dptbl (p, t) ~default:(fun () ->
      if p = 0
      then 0
      else (
        match t with
        | 0 -> ll * p
        | 1 -> aa.(p) + Int.min (dp (p - 1) 0) (dp (p - 1) 1)
        | 2 -> (0 -- 2 |> map ~f:(fun i -> dp (p - 1) i) |> min |> Option.value ~default:0) + rr
        | _ -> failwith ""))
;;

let () =
  let v = 0 -- 2 |> map ~f:(fun i -> dp nn i) |> min in
  pi @@ Option.value_exn v
;;
