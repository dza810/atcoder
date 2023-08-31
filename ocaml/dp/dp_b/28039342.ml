//##// Contest ID: dp
//##// Problem ID: dp_b ( https://atcoder.jp/contests/dp/tasks/dp_b )
//##// Title: B. Frog 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-12-20 15:58:48 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/28039342 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id
let k = scanf "%d " id
let h = Array.init n ~f:(fun _ -> scanf "%d " id)

(* *)
let dp = Array.init (n + 1) ~f:(fun _ -> None)
let h i = if i <= 0 || n < i then None else Some h.(i - 1)

(* i --> j *)
let rec next i j =
  let c = cost i in
  let hi = h i in
  let hj = h j in
  match c, hi, hj with
  | Some c, Some hi, Some hj -> Some (c + Int.abs (hi - hj))
  | _ -> None

and cost j =
  if j = 1
  then Some 0
  else if j <= 0 || n < j
  then None
  else (
    match dp.(j) with
    | Some x -> Some x
    | None ->
      let out =
        List.init k ~f:(fun km ->
            let k = km + 1 in
            let i = j - k in
            next i j)
        |> List.filter_map ~f:id
        |> List.fold ~init:99999999999999 ~f:min
      in
      dp.(j) <- Some out;
      Some out)
;;

let () = cost n |> Option.value ~default:(-1) |> printf "%d\n"
