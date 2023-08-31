//##// Contest ID: abc256
//##// Problem ID: abc256_d ( https://atcoder.jp/contests/abc256/tasks/abc256_d )
//##// Title: D. Union of Interval
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 13:05:51 +0000 UTC ( https://atcoder.jp/contests/abc256/submissions/32563546 ) 

open Core

(* open Num *)
(* open IterLabels *)

let id x = x
let si _ = Scanf.scanf " %d" id
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
let tbl = Array.init 200_010 ~f:(fun _ -> 0)
let lr = 1 -- nn >>| si2

let () =
  lr
  |> iter ~f:(fun (l, r) ->
         tbl.(l) <- tbl.(l) + 1;
         tbl.(r) <- tbl.(r) - 1)
;;

let (_ : _) =
  tbl
  |> Array.foldi ~init:(None, 0) ~f:(fun i (l, acc) x ->
         let acc = acc + x in
         match l with
         | None when acc > 0 -> Some i, acc (* start *)
         | Some l when acc = 0 ->
           printf "%d %d\n" l i;
           None, acc (* end *)
         | _ -> l, acc)
;;
