//##// Contest ID: typical90
//##// Problem ID: typical90_ar ( https://atcoder.jp/contests/typical90/tasks/typical90_ar )
//##// Title: 044. Shift and Swapping（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-12-28 06:06:17 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37593613 ) 

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
  let module M = Array in
  let (_ : int) =
    M.fold l ~init:(M.length l) ~f:(fun acc x ->
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

(************)

let nn, qq = si2 ()
let aa = Array.init nn ~f:si
let idx shift x =
  let x = (x - shift - 1) % nn in
  x
;;

let swap shift a x y =
  let x = idx shift x in
  let y = idx shift y in
  let tmp = a.(x) in
  a.(x) <- a.(y);
  a.(y) <- tmp
;;

let get shift a x = a.(idx shift x)

let pl shift =
  for x = 1 to nn do
    let x = idx shift x in
    printf "%d; " aa.(x)
  done;
  printf "\n"
;;

let main () =
  let shift = ref 0 in
  for _ = 1 to qq do
    let t, x, y = si3 () in
    (match t with
    | 1 -> swap !shift aa x y
    | 2 -> Int.incr shift
    | 3 -> pi @@ get !shift aa x
    | _ -> failwith "");
    ()
  done
;;

let () = main ()
