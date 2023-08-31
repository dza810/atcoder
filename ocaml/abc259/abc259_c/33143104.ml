//##// Contest ID: abc259
//##// Problem ID: abc259_c ( https://atcoder.jp/contests/abc259/tasks/abc259_c )
//##// Title: C. XX to XXX
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-10 07:41:13 +0000 UTC ( https://atcoder.jp/contests/abc259/submissions/33143104 ) 

open Core
open Printf

(* open Num *)
(* open IterLabels *)

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

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)
let ( >|| ) x f = iter ~f x
let sort_int = sort ~compare:Int.compare

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let option_either l ~f =
  List.fold l ~init:None ~f:(fun acc x ->
      match acc with
      | None -> f x
      | Some x -> Some x)
;;

(************)
let s = ss ()
let t = ss ()

let run_length s =
  s
  |> String.fold ~init:[] ~f:(fun acc x ->
         match acc with
         | (prev, c) :: ls when Char.(prev = x) -> (x, c + 1) :: ls
         | ls -> (x, 1) :: ls)
;;

let () =
  let s = run_length s in
  let t = run_length t in
  let rec aux = function
    | [] -> ps "Yes"
    | ((sc, sv), (tc, tv)) :: zz when Char.(sc = tc) ->
      if sv = tv || (sv >= 2 && tv > sv) then aux zz else ps "No"
    | _ -> ps "No"
  in
  match zip s t with
  | Unequal_lengths -> ps "No"
  | Ok x -> aux x
;;
