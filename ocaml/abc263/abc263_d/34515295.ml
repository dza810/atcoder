//##// Contest ID: abc263
//##// Problem ID: abc263_d ( https://atcoder.jp/contests/abc263/tasks/abc263_d )
//##// Title: D. Left Right Operation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 15:02:02 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34515295 ) 

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

(************)
let nn, ll, rr = si3 ()
let aa = Array.init (nn + 2) ~f:(fun i -> if i = 0 || i = nn + 1 then 0 else si () )
let bb = aa |> of_array |> rev |> to_array
;;
let left_tbl = Hashtbl.create (module Int)
;;
let right_tbl = Hashtbl.create (module Int)

let rec left_min x =
  if x = 0 then 0 else
  Hashtbl.find_or_add left_tbl x ~default:(fun () ->
      let v1 = aa.(x) + left_min (x - 1) in
      let v2 = Int.min aa.(x) ll + (ll * (x - 1)) in
      Int.min v1 v2)
;;

let rec right_min x =
  if x = 0 then 0 else
  Hashtbl.find_or_add right_tbl x ~default:(fun () ->
      let v1 = bb.(x) + right_min (x - 1) in
      let v2 = Int.min bb.(x) rr + (rr * (x - 1)) in
      Int.min v1 v2)
;;

let () = 0 -- nn >|= (fun i -> left_min i + right_min (nn - i)) |> min_exn ?lt:None |> pi
