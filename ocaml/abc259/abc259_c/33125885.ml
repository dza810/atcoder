//##// Contest ID: abc259
//##// Problem ID: abc259_c ( https://atcoder.jp/contests/abc259/tasks/abc259_c )
//##// Title: C. XX to XXX
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-09 13:58:59 +0000 UTC ( https://atcoder.jp/contests/abc259/submissions/33125885 ) 

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

let aux str =
  String.fold str ~init:[] ~f:(fun acc x ->
      match acc with
      | [] -> [ x, 1 ]
      | (y, c) :: xs when Char.(x = y) -> (x, c + 1) :: xs
      | (y, c) :: xs -> (x, 1) :: (y, c) :: xs)
;;

let () =
  let s = aux s in
  let t = aux t in
  (* let () = eprint_s @@ [%sexp_of: (char * int) list] @@ s in *)
  (* let () = eprint_s @@ [%sexp_of: (char * int) list] @@ t in *)
  match zip s t with
  | Unequal_lengths -> ps "No" (* 1. false *)
  | Ok x ->
    let ans =
      x
      |> fold ~init:true ~f:(fun acc (s, t) ->
             acc
             && Char.(fst s = fst t) (* 2. *)
             && (snd s = snd t || (snd s >= 2 && snd t >= snd s)))
    in
    ps @@ if ans then "Yes" else "No"
;;
