//##// Contest ID: abc264
//##// Problem ID: abc264_c ( https://atcoder.jp/contests/abc264/tasks/abc264_c )
//##// Title: C. Matrix Reducing
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-01 13:23:51 +0000 UTC ( https://atcoder.jp/contests/abc264/submissions/34496401 ) 

open Core
open Printf

(* open Num *)
open IterLabels

(* module Iter = IterLabels *)
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

let cache tbl key ~f =
  match Stdlib.Hashtbl.find_opt tbl key with
  | Some x -> x
  | None ->
    let x = f () in
    Stdlib.Hashtbl.add tbl key x;
    x
;;

(************)

let h1, w1 = si2 ()
let aa = Array.init h1 ~f:(fun _ -> Array.init w1 ~f:si)
let h2, w2 = si2 ()
let bb = Array.init h2 ~f:(fun _ -> Array.init w2 ~f:si)

let rec comb (n : int) (li : 'a list) : 'a list iter =
  (if n = 0
  then return []
  else (
    match li with
    | [] -> failwith ""
    | x :: xs ->
      let a =
        if List.length xs >= n - 1
        then comb (n - 1) xs |> map ~f:(fun l -> x :: l)
        else return []
      in
      let b = if List.length xs >= n then comb n xs else return [] in
      append a b))
  |> filter ~f:(fun l -> List.length l = n)
;;

(* 
let v : bool =
  0 -- ((1 lsl h1) - 1)
  >>= (fun h ->
        0 -- ((1 lsl w1) - 1)
        >|= fun w ->
        let hvec = 0 -- (h1 - 1) |> filter ~f:(fun k -> h land (1 lsl k) = 0) in
        let wvec = 0 -- (w1 - 1) |> filter ~f:(fun k -> w land (1 lsl k) = 0) in
        if length hvec = h2 && length wvec = w2
        then
          hvec
          |> foldi ~init:true ~f:(fun acc i h ->
                 wvec
                 |> foldi ~init:acc ~f:(fun acc j w -> acc && aa.(h).(w) = bb.(i).(j)))
        else false)
  |> exists ~f:id
;; *)

let v : bool =
  let ch = comb h2 (List.init h1 ~f:id) in
  let cw = comb w2 (List.init w1 ~f:id) in
  ch
  >>= (fun hvec ->
        cw
        >|= fun wvec ->
        hvec
        |> List.foldi ~init:true ~f:(fun i acc h ->
               wvec
               |> List.foldi ~init:acc ~f:(fun j acc w -> acc && aa.(h).(w) = bb.(i).(j))))
  |> exists ~f:id
;;

let () = ps @@ if v then "Yes" else "No"
