//##// Contest ID: typical90
//##// Problem ID: typical90_av ( https://atcoder.jp/contests/typical90/tasks/typical90_av )
//##// Title: 048. I will not drop out（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-17 09:21:49 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33287827 ) 

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

let aa =
  List.init nn ~f:(fun _ ->
      let a, b = si2 () in
      [ b; a - b ])
  |> List.concat
  |> List.sort ~compare:Int.compare
  |> List.rev
;;

let () =
  aa |> List.foldi ~init:0 ~f:(fun i acc x -> if i < kk then acc + x else acc) |> pi
;;
