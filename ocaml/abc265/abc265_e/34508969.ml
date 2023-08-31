//##// Contest ID: abc265
//##// Problem ID: abc265_e ( https://atcoder.jp/contests/abc265/tasks/abc265_e )
//##// Title: E. Warp
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 08:59:37 +0000 UTC ( https://atcoder.jp/contests/abc265/submissions/34508969 ) 

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

let m x = x % 998244353
let nn, mm = si2 ()
let aa = si ()
let bb = si ()
let cc = si ()
let dd = si ()
let ee = si ()
let ff = si ()
let xytmp = Array.init mm ~f:si2
let xy = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))
let () = Array.iter xytmp ~f:(fun p -> Hashtbl.add_exn xy ~key:p ~data:true)

let dptbl =
  Array.init (nn + 1) ~f:(fun _ ->
      Array.init (nn + 1) ~f:(fun _ -> Array.init (nn + 1) ~f:(fun _ -> None)))
;;

let rec dp x y z =
  if x < 0 || y < 0 || z < 0
  then 0
  else (
    match dptbl.(x).(y).(z) with
    | Some x -> x
    | None ->
      let v = dp_calc x y z in
      dptbl.(x).(y).(z) <- Some v;
      v)

and dp_calc x y z =
  if x = 0 && y = 0 && z = 0
  then 1
  else if x < 0 || y < 0 || z < 0
  then 0
  else (
    let px = (x * aa) + (y * cc) + (z * ee) in
    let py = (x * bb) + (y * dd) + (z * ff) in
    if Option.is_some @@ Hashtbl.find xy (px, py)
    then 0
    else m (dp (x - 1) y z + dp x (y - 1) z + dp x y (z - 1)))
;;

let () =
  let v =
    0 -- nn
    >>= fun x ->
    0 -- (nn - x)
    >>= fun y ->
    0 -- (nn - x - y) >>= fun z -> return @@ if x + y + z = nn then dp x y z else 0
  in
  v |> fold ~init:0 ~f:(fun acc x -> m acc + m x |> m) |> pi
;;
