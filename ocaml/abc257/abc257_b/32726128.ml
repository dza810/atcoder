//##// Contest ID: abc257
//##// Problem ID: abc257_b ( https://atcoder.jp/contests/abc257/tasks/abc257_b )
//##// Title: B. 1D Pawn
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-25 12:31:53 +0000 UTC ( https://atcoder.jp/contests/abc257/submissions/32726128 ) 

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

let nn, kk, qq = si3 ()
let aa = 1 -- kk >>| si >>| fun x -> x - 1
let ll = 1 -- qq >>| si
let koma = Array.init nn ~f:(fun _ -> 0)
let () = aa >|| fun i -> koma.(i) <- koma.(i) + 1

let get_lth l =
  let _, out =
    koma
    |> Array.foldi ~init:(0, None) ~f:(fun i (c, out) x ->
           match out with
           | Some _ -> c, out
           | None ->
             let c = if x > 0 then c + x else c in
             if c = l then c, Some i else c, None)
  in
  out |> option_exn
;;

let () =
  (ll
  >|| fun l ->
  let i = get_lth l in
  if i < 0
  then ()
  else if i = nn - 1
  then ()
  else if koma.(i + 1) = 0
  then (
    koma.(i) <- koma.(i) - 1;
    koma.(i + 1) <- koma.(i + 1) + 1)
  else ());
  let _:_ = koma
  |> Array.foldi ~init:0 ~f:(fun i (acc:int) x ->
    if x > 0 then
      match acc with
      | 0 -> printf "%d" (i + 1) ; acc + 1
      | acc -> printf " %d" (i + 1) ; acc
    else acc) in
  print_endline ""
;;
