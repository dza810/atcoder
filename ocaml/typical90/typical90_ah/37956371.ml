//##// Contest ID: typical90
//##// Problem ID: typical90_ah ( https://atcoder.jp/contests/typical90/tasks/typical90_ah )
//##// Title: 034. There are few types of elements（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-12 06:42:51 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37956371 ) 

open Printf
open Scanf
open IterLabels
open Core
open Num

module M = struct
  module Int = struct
    let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

    include Int
  end

  let _idx f arr i =
    try f arr i
    with _ as e ->
      eprintf "(length=%d, idx=%d)\n" (Array.length arr) i;
      raise e

  let ( .%{} ) arr i = _idx Array.get arr i
  let ( .%{}<- ) arr i = _idx Array.set arr i
  let id x = x
  let si _ = scanf " %d" id
  let sc _ = scanf " %c" id
  let ss _ = scanf " %s" id
  let sn _ = scanf " %s" num_of_string
  let si2 _ = scanf " %d %d" (fun x y -> (x, y))
  let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
  let pi ?(list = false) x = if list then eprintf " %d;" x else printf "%d\n" x

  let pf ?(list = false) x =
    if list then eprintf " %0.10f;" x else printf "%0.10f\n" x

  let ps ?(list = false) x = if list then eprintf " %s;" x else printf "%s\n" x

  let pa ?(list = false) ?(prefix = "") ~p l =
    eprintf "%s [" prefix;
    Array.iter l ~f:(fun x -> p ?list:(Some true) x);
    eprintf "]\n"

  let pl ?(list = false) ?(prefix = "") ~p l =
    eprintf "%s [" prefix;
    List.iter l ~f:(fun x -> p ?list:(Some true) x);
    eprintf "]\n";
    l

  let rec bin_search ~f l r =
    (* `f l` is always true, `f r` is always false *)
    if r - l <= 1 then l
    else
      let c = ((r - l) / 2) + l in
      if f c then bin_search ~f c r else bin_search ~f l c

  let ( %/ ) x y = mod_num x y
  let i2n = num_of_int
  let zero = num_of_int 0
  let one = num_of_int 1
  let two = num_of_int 2
end

open M

(************)
let nn, kk = si2 ()
let aa = Array.init nn ~f:si

(* let tbl = Array.create ~len:1_000_000_001 0 *)
let tbl = Hashtbl.create (module Int)
let get x = Hashtbl.find_or_add tbl x ~default:(fun _ -> 0)
let add x v = Hashtbl.update tbl x ~f:(function None -> v | Some vv -> vv + v)

let rec loop ans l r k =
  let ans = if kk >= k then Int.max ans (r - l) else ans in
  if r = nn then ans
  else if k > kk then (
    add aa.(l) (-1);
    let k = k - if get aa.(l) = 0 then 1 else 0 in
    loop ans (l + 1) r k)
  else
    let k = k + if get aa.(r) = 0 then 1 else 0 in
    add aa.(r) 1;
    loop ans l (r + 1) k

let () = pi @@ loop 0 0 0 0
