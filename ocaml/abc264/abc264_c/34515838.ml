//##// Contest ID: abc264
//##// Problem ID: abc264_c ( https://atcoder.jp/contests/abc264/tasks/abc264_c )
//##// Title: C. Matrix Reducing
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 15:31:07 +0000 UTC ( https://atcoder.jp/contests/abc264/submissions/34515838 ) 

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

let ha, wa = si2 ()
let aa = 1 -- ha >|= (fun _ -> 1 -- wa >|= (fun _ -> si ()) |> to_array) |> to_array
let hb, wb = si2 ()
let bb = 1 -- hb >|= (fun _ -> 1 -- wb >|= (fun _ -> si ()) |> to_array) |> to_array

let rec comb n (lst : int list) =
  if n = 0
  then return @@ []
  else (
    let rec inner = function
      | [] -> empty
      | x :: (xs : int list) ->
        append (comb (n - 1) xs |> map ~f:(fun l -> x :: l)) (inner xs)
    in
    inner lst)
;;


let flg =
  (comb hb (0 -- (ha - 1) |> to_list) >>= fun hs ->
    comb wb (0 -- (wa - 1) |> to_list) >>= fun ws ->
      return @@ List.foldi hs ~init:true ~f:(fun i acc h ->
        List.foldi ws ~init:acc ~f:(fun j acc w ->
          acc && aa.(h).(w) = bb.(i).(j)
        ))     
    ) |> exists ~f:id 

let () =
    ps @@ if flg then "Yes" else "No"