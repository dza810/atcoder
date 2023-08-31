//##// Contest ID: abs
//##// Problem ID: abc085_b ( https://atcoder.jp/contests/abs/tasks/abc085_b )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 03:15:58 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32526610 ) 

open Core
(* open Num *)
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

(************)
let nn = si ()

let dd = (1 -- nn) >|= si |> sort |> uniq

let () = dd |> length |> pi