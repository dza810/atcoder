//##// Contest ID: typical90
//##// Problem ID: typical90_at ( https://atcoder.jp/contests/typical90/tasks/typical90_at )
//##// Title: 046. I Love 46（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-17 09:04:18 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33287480 ) 

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

let input_ () =
  let tbl = Hashtbl.create (module Int) in
  (1 -- nn) (fun _ ->
      let x = si () in
      let x = x % 46 in
      Hashtbl.change tbl x ~f:(function
          | None -> Some 1
          | Some x -> Some (x + 1)));
  tbl
;;

let aa = input_ ()
let bb = input_ ()
let cc = input_ ()

let () =
  aa
  |> Hashtbl.fold ~init:0 ~f:(fun ~key:a ~data:av acc ->
         acc
         + (bb
           |> Hashtbl.fold ~init:0 ~f:(fun ~key:b ~data:bv acc ->
                  acc
                  + (cc
                    |> Hashtbl.fold ~init:0 ~f:(fun ~key:c ~data:cv acc ->
                           acc + if (a + b + c) % 46 = 0 then av * bv * cv else 0)))))
  |> pi
;;
