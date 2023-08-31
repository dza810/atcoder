//##// Contest ID: typical90
//##// Problem ID: typical90_z ( https://atcoder.jp/contests/typical90/tasks/typical90_z )
//##// Title: 026. Independent Set on a Tree（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-01 14:49:50 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32871774 ) 

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

let p_aux p ?(newline = true) x =
  p x;
  if newline then print_endline ""
;;

let pi = p_aux @@ fun d -> printf "%d" d
let pi2 = p_aux @@ fun (a, b) -> printf "%d %d" a b
let ps = p_aux @@ fun s -> printf "%s" s
let pf = p_aux @@ fun f -> printf "%0.6f" f

let rec pl (p : ?newline:bool -> 'a) = function
  | [] -> print_endline ""
  | [ x ] -> p x
  | x :: xs ->
    p ~newline:false x;
    print_string " ";
    pl p xs
;;

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)
let ( >|| ) x f = iter ~f x
let sort_int = sort ~compare:Int.compare
let first ~n l = fst @@ split_n l n

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
let nn = si ()
let ab = 1 -- (nn - 1) >>| si2

let tbl =
  let tbl = Hashtbl.create (module Int) in
  let () =
    ab
    >|| fun (a, b) ->
    let a, b = a - 1, b - 1 in
    Hashtbl.add_multi tbl ~key:a ~data:b;
    Hashtbl.add_multi tbl ~key:b ~data:a
  in
  tbl
;;

let color = Array.init nn ~f:(fun _ -> 0)

let rec colorize col i =
  if color.(i) = 0
  then (
    color.(i) <- col;
    Hashtbl.find_multi tbl i >|| fun x -> colorize (-1 * col) x)
;;

let () =
  let () = colorize 1 1 in
  let one = color |> Array.filter ~f:(( = ) 1) |> Array.length in
  let col = if one >= nn/2 then 1 else -1 in
  color
  |> Array.filter_mapi ~f:(fun i x -> if x = col then Some (i+1) else None)
  |> Array.to_list
  |> first ~n:(nn / 2) |> pl pi
;;
