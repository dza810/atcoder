//##// Contest ID: abc256
//##// Problem ID: abc256_b ( https://atcoder.jp/contests/abc256/tasks/abc256_b )
//##// Title: B. Batters
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 12:16:51 +0000 UTC ( https://atcoder.jp/contests/abc256/submissions/32548810 ) 

open Core

(* open Num *)
(* open IterLabels *)

let id x = x
let si _ = Scanf.scanf " %d" id

(* let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y) *)
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)

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
let aa = 1 -- nn |> map ~f:si

let () =
  let _, p =
    aa
    |> fold ~init:([], 0) ~f:(fun (c, p) a ->
           let c = 0 :: c in
           let c = c |> map ~f:(( + ) a) in
           let p = fold c ~init:p ~f:(fun acc x -> if x >= 4 then acc + 1 else acc) in
           let c = c |> filter ~f:(fun x -> x < 4) in
           c, p)
  in
  pi p
;;
