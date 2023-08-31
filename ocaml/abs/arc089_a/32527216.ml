//##// Contest ID: abs
//##// Problem ID: arc089_a ( https://atcoder.jp/contests/abs/tasks/arc089_a )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 04:08:16 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32527216 ) 

open Core

(* open Num *)
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

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
let txy = 1 -- nn >|= fun _ -> 
  let t = si () in
  let x = si () in
  let y = si () in
  (t, x, y)

let () =
  let flg =
    txy
    |> fold ~init:(Some(0, 0, 0)) ~f:(fun acc (t, x, y) ->
           match acc with
           | None -> None
           | Some (pt, px, py) ->
            let d = t - pt - Int.abs (x - px) - Int.abs (py - y) in
             if d >= 0 && d mod 2 = 0
             then Some (t, x, y)
             else None)
    |> Option.is_some
  in
  ps @@ if flg then "Yes" else "No"
;;
