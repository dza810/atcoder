//##// Contest ID: dp
//##// Problem ID: dp_f ( https://atcoder.jp/contests/dp/tasks/dp_f )
//##// Title: F. LCS
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-12-20 22:15:21 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/28041066 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let s = scanf "%s " id
let t = scanf "%s " id

let dp =
  Array.init
    (1 + String.length s)
    ~f:(fun _ -> Array.init (1 + String.length t) ~f:(fun _ -> None))
;;

let rec calc is it =
  if is = 0 || it = 0
  then 0, []
  else (
    match dp.(is).(it) with
    | Some x -> x
    | None ->
      let out =
        if Char.(s.[is - 1] = t.[it - 1])
        then (
          let x, cl = calc (is - 1) (it - 1) in
          x + 1, s.[is - 1] :: cl)
        else (
          let xa, cla = calc (is - 1) it in
          let xb, clb = calc is (it - 1) in
          if xa < xb then xb, clb else xa, cla)
      in
      dp.(is).(it) <- Some out;
      out)
;;

let () =
  let _, o = calc (String.length s) (String.length t) in
  o |> List.rev |> String.of_char_list |> print_endline
;;
