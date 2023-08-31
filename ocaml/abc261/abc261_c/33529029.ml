//##// Contest ID: abc261
//##// Problem ID: abc261_c ( https://atcoder.jp/contests/abc261/tasks/abc261_c )
//##// Title: C. NewFolder(1)
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-26 06:37:32 +0000 UTC ( https://atcoder.jp/contests/abc261/submissions/33529029 ) 

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
let tbl = Hashtbl.create (module String)
let nn = si ()

let calc _ =
  let s = ss () in
  Hashtbl.change tbl s ~f:(function
      | None ->
        ps s;
        Some 1
      | Some x -> ps (s ^ "(" ^ (Int.to_string x) ^ ")"); Some (x+1))
;;

let _:_ = (1 -- nn) calc