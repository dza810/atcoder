//##// Contest ID: abc267
//##// Problem ID: abc267_b ( https://atcoder.jp/contests/abc267/tasks/abc267_b )
//##// Title: B. Split?
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-06 07:05:40 +0000 UTC ( https://atcoder.jp/contests/abc267/submissions/34650600 ) 

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

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d \n" x else printf "%d " x;
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

(************)

let pins = 1 -- 10 >|= sc >|= Char.to_string >|= Int.of_string |> to_array
let rows = Array.create ~len:7 0

let () =
  rows.(0) <- pins.(6);
  rows.(1) <- pins.(3);
  rows.(2) <- pins.(1) + pins.(7);
  rows.(3) <- pins.(0) + pins.(4);
  rows.(4) <- pins.(2) + pins.(8);
  rows.(5) <- pins.(5);
  rows.(6) <- pins.(9);
;;

let rec loop_1 i =
  if i = 6 then false else
  if rows.(i) > 0 && rows.(i + 1) = 0 then loop_2 (i + 1) else loop_1 (i + 1)
and loop_2 i =
    if i = 7 then false else
    if rows.(i) > 0 then true else loop_2 (i + 1)


let () = ps @@ if pins.(0) = 0 && loop_1 0 then "Yes" else "No"
