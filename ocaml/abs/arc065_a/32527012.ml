//##// Contest ID: abs
//##// Problem ID: arc065_a ( https://atcoder.jp/contests/abs/tasks/arc065_a )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 03:50:52 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32527012 ) 

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
let ss = ss ()

let s1 = "dream"

let s2 = "dreamer"

let s3 = "erase"
let s4 = "eraser"

let option_either l ~f =
  List.fold l ~init:None ~f:(fun acc x ->
    match acc with
    | None -> f x
    | Some x -> Some x)

let calc s = option_either [s1;s2;s3;s4] ~f:(fun suffix -> String.chop_suffix s ~suffix)

let () =
  let rec aux = function
  | Some s -> if String.length s = 0 then "YES" else aux @@ calc s
  | _ -> "NO"
  in
  aux (Some ss) |> ps