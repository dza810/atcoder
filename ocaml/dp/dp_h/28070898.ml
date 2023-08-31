//##// Contest ID: dp
//##// Problem ID: dp_h ( https://atcoder.jp/contests/dp/tasks/dp_h )
//##// Title: H. Grid 1
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-12-22 21:06:29 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/28070898 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let h = scanf "%d " id
let w = scanf "%d " id
let a = Array.init h ~f:(fun _ -> Array.init w ~f:(fun _ -> scanf "%c " id))
let f x = x mod 1000000007

let a i j =
  assert (i >= 1 && j >= 1);
  a.(i - 1).(j - 1)
;;

let dp_tbl = Array.init (h + 1) ~f:(fun _ -> Array.init (w + 1) ~f:(fun _ -> None))

(* *)
let rec calc i j =
  (* *)
  if i = 1 && j = 1
  then Some 1
  else if i < 1 || h < i || j < 1 || w < j
  then None
  else (
    match dp_tbl.(i).(j) with
    | Some x -> x
    | None ->
      let x =
        if Char.(a i j = '#')
        then None
        else if Char.(a i j = '.')
        then (
          let x = Option.value ~default:0 @@ calc i (j - 1) in
          let y = Option.value ~default:0 @@ calc (i - 1) j in
          Some (f (x + y)))
        else failwith (sprintf "i=%d, j=%d" i j)
      in
      dp_tbl.(i).(j) <- Some x;
      x)
;;

let () = calc h w |> Option.value ~default:0 |> printf "%d\n"
