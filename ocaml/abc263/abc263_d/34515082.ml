//##// Contest ID: abc263
//##// Problem ID: abc263_d ( https://atcoder.jp/contests/abc263/tasks/abc263_d )
//##// Title: D. Left Right Operation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 14:49:41 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34515082 ) 

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

(************)
let nn, ll, rr = si3 ()
let aa = Array.init nn ~f:si
let dptbl = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))

let rec dp p t =
  if p = -1 then 0 else
  Hashtbl.find_or_add dptbl (p, t) ~default:(fun () ->
      match t with
      | 0 -> (p + 1) * ll
      | 1 -> aa.(p) + Int.min (dp (p - 1) 0) (dp (p - 1) 1)
      | 2 -> rr + (Int.min (dp (p - 1) 0) @@ Int.min (dp (p - 1) 1) (dp (p - 1) 2))
      | _ -> failwith "")
;;

let () = 0 -- 2 >|= (fun i -> dp (nn - 1) i) |> min_exn ?lt:None |> pi