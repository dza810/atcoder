//##// Contest ID: typical90
//##// Problem ID: typical90_ax ( https://atcoder.jp/contests/typical90/tasks/typical90_ax )
//##// Title: 050. Stair Jump（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-17 09:28:12 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33287954 ) 

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
let nn, ll = si2 ()
let dp_tbl = Hashtbl.create (module Int)

let rec dp x =
  Hashtbl.find_or_add dp_tbl x ~default:(fun () ->
      if x < 0 then 0 else if x = 0 then 1 else (dp (x - ll) + dp (x - 1)) % 1_000_000_007)
;;

let () = pi @@ dp nn
