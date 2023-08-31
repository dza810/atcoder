//##// Contest ID: typical90
//##// Problem ID: typical90_h ( https://atcoder.jp/contests/typical90/tasks/typical90_h )
//##// Title: 008. AtCounter（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 10:20:08 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34528874 ) 

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

(* ********** *)
let nn = si ()
let ss = Array.init nn ~f:sc
let m x = x % 1_000_000_007
let atcoder = "atcoder" |> String.to_array
let calctbl = Stdlib.Hashtbl.create 100000

let rec calc i n =
  if i = -1
  then 1
  else if n = -1
  then 0
  else
    cache calctbl (i, n) ~f:(fun () ->
        let v =
          calc i (n - 1) + if Char.(ss.(n) = atcoder.(i)) then calc (i - 1) (n - 1) else 0
        in
        m v)
;;

let () = pi @@ calc 6 (nn - 1)
