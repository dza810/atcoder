//##// Contest ID: abc268
//##// Problem ID: abc268_d ( https://atcoder.jp/contests/abc268/tasks/abc268_d )
//##// Title: D. Unique Username
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-11 06:09:23 +0000 UTC ( https://atcoder.jp/contests/abc268/submissions/34776311 ) 

open Core
open Printf
open Num
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

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%s \n" x else printf "%s " x;
        acc - 1)
  in
  ()
;;

let cache tbl key ~f =
  match Stdlib.Hashtbl.find_opt tbl key with
  | Some x -> x
  | None ->
    let x = f () in
    Stdlib.Hashtbl.add tbl key x;
    x
;;

let i2f x = Int.to_float x

let rec combination k li =
  if k = 0
  then singleton []
  else (
    match li with
    | [] -> empty
    | l :: li -> append (combination (k - 1) li >|= fun li -> l :: li) (combination k li))
;;

let rec parmutation k li =
  if k = 0 then singleton [] else
  let rec aux ls rs =
    match ls with
    | [] -> empty
    | l :: ls ->
      append (parmutation (k - 1) (ls @ rs) >|= fun rest -> l :: rest) (aux ls (l :: rs))
  in
  aux li []
;;

(************)
let nn = si ()
let mm = si ()
let s = 1 -- nn >|= ss |> persistent
let used = Hashtbl.create (module String)
let t = 1 -- mm >|= ss |> iter ~f:(fun s -> Hashtbl.add_exn used ~key:s ~data:true)
let s_sum = s >|= String.length |> sum
let bar_n n = 1 -- n >|= (fun _ -> "_") |> concat_str

let rec make_string l xs =
  if l < 0
  then empty
  else (
    match xs with
    | [] -> failwith ""
    | [ x ] -> singleton x
    | x :: xs ->
      1 -- l >>= fun i -> make_string (l - i) xs >|= fun rest -> x ^ bar_n i ^ rest)
;;


let x =
  if s_sum + (nn - 1) > 16 then None else
  to_list s
  |> parmutation nn
  >>= (fun x -> make_string (16 - s_sum) x)
  |> filter ~f:(fun x -> let l = String.length x in 3 <= l && l <= 16 && not @@ Option.is_some @@ Hashtbl.find used x)
  |> find_map ~f:(fun x -> Some x)
;;

let () = ps @@ Option.value ~default:"-1" x

