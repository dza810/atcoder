//##// Contest ID: abc267
//##// Problem ID: abc267_d ( https://atcoder.jp/contests/abc267/tasks/abc267_d )
//##// Title: D. Index × A(Not Continuous ver.)
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-06 07:47:01 +0000 UTC ( https://atcoder.jp/contests/abc267/submissions/34651426 ) 

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

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d \n" x else printf "%d " x;
        acc - 1)
  in
  ()
;;

let cache tbl key ~f =
  match Stdlib.Hashtbl.find_opt tbl key with
  | Some x -> x
  | None ->
    let x = f () in
    Stdlib.Hashtbl.add tbl key x;
    x
;;

let i2f x = Int.to_float x

(************)
let nn = si ()
let mm = si ()
let aa = Array.create ~len:(nn + 1) 0
let () = 1 -- nn |> iter ~f:(fun i -> aa.(i) <- si ())
let dptbl = Array.make_matrix ~dimx:2001 ~dimy:2001 None

let rec dp m r =
  if m = 0
  then 0
  else if r < m
  then failwith ""
  else (
    match dptbl.(m).(r) with
    | Some x -> x
    | None ->
      let v = dp (m - 1) (r - 1) + (m * aa.(r)) in
      let v = if r > m then Int.max v (dp m (r - 1)) else v in
      dptbl.(m).(r) <- Some v;
      v)
;;

let () = pi @@ dp mm nn
