//##// Contest ID: typical90
//##// Problem ID: typical90_ah ( https://atcoder.jp/contests/typical90/tasks/typical90_ah )
//##// Title: 034. There are few types of elements（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-14 07:34:14 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33216634 ) 

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
let nn, kk = si2 ()
let a = Array.init nn ~f:si
let tbl = Hashtbl.create (module Int)
let get_tbl x = Hashtbl.find_or_add tbl x ~default:(fun () -> 0)

let sub_tbl x =
  Hashtbl.change tbl x ~f:(function
      | Some x when x > 0 -> Some (x - 1)
      | _ -> failwith "")
;;

let add_tbl x =
  Hashtbl.change tbl x ~f:(function
      | Some x -> Some (x + 1)
      | None -> Some 0)
;;

let rec loop_right ans cnt l r =
  if r >= nn || (get_tbl a.(r) = 0 && cnt = kk)
  then loop_left ans cnt l r
  else (
    let cnt = cnt + if get_tbl a.(r) = 0 then 1 else 0 in
    let () = add_tbl a.(r) in
    loop_right ans cnt l (r + 1))

and loop_left ans cnt l r =
  let ans = Int.max ans (r - l) in
  assert (get_tbl a.(l) > 0);
  let cnt = cnt - if get_tbl a.(l) = 1 then 1 else 0 in
  let () = sub_tbl a.(l) in
  if l < nn - 1 then loop_right ans cnt (l + 1) r else ans
;;

let () = loop_right 0 0 0 0 |> pi
