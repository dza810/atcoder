//##// Contest ID: abc262
//##// Problem ID: abc262_b ( https://atcoder.jp/contests/abc262/tasks/abc262_b )
//##// Title: B. Triangle (Easier)
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-01 07:30:01 +0000 UTC ( https://atcoder.jp/contests/abc262/submissions/33706499 ) 

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
let nn, mm = si2 ()
let tbl = Hashtbl.create (module Int)

let () =
  (1 -- mm) (fun _ ->
      let u, v = si2 () in
      Hashtbl.add_multi tbl ~key:u ~data:v;
      Hashtbl.add_multi tbl ~key:v ~data:u)
;;

let () =
  1 -- nn
  |> map ~f:(fun a ->
         a + 1 -- nn
         |> map ~f:(fun b ->
                b + 1 -- nn
                |> map ~f:(fun c ->
                       let ab_flg =
                         Hashtbl.find_multi tbl a |> List.exists ~f:(fun a -> a = b)
                       in
                       let bc_flg =
                         Hashtbl.find_multi tbl b |> List.exists ~f:(fun b -> b = c)
                       in
                       let ca_flg =
                         Hashtbl.find_multi tbl c |> List.exists ~f:(fun c -> c = a)
                       in
                       if ab_flg && bc_flg && ca_flg then 1 else 0)
                |> sum)
         |> sum)
  |> sum
  |> pi
;;
