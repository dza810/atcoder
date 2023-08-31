//##// Contest ID: abs
//##// Problem ID: abc085_c ( https://atcoder.jp/contests/abs/tasks/abc085_c )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 03:31:44 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32526778 ) 

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
let yy = si ()

let () =
  let tk, fk, k = (0 -- nn
  >>= fun tk ->
  0 -- (nn - tk)
  >>= fun fk ->
  let k = nn - tk - fk in
  if (10000 * tk) + (5000 * fk) + (1000 * k) = yy
  then return @@ Some (tk, fk, k)
  else
    return @@ None)
    |> keep_some
    |> head
    |> Option.value ~default:(-1, -1, -1)
  in
  printf "%d %d %d\n" tk fk k;
;;
