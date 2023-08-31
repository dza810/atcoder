//##// Contest ID: dp
//##// Problem ID: dp_l ( https://atcoder.jp/contests/dp/tasks/dp_l )
//##// Title: L. Deque
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-14 10:26:11 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23473896 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id
let an = Array.init n ~f:(fun _ -> scanf "%d " id)

let dp_tbl : int option option array array =
  Array.init 3100 ~f:(fun _ -> Array.init 3100 ~f:(fun _ -> None))
;;

let rec dp i j : int option =
  if i = j
  then Some ((if (i + j - n - 1) mod 2 = 0 then 1 else -1) * an.(i))
  else (
    match dp_tbl.(i).(j) with
    | Some v -> v
    | None ->
      let ( @ ), f =
        if (i + j - n - 1) mod 2 = 0 then ( + ), Int.max else ( - ), Int.min
      in
      let v =
        match dp (i + 1) j, dp i (j - 1) with
        | Some r, Some l -> Some (f (r @ an.(i)) (l @ an.(j)))
        | None, Some l -> Some (l @ an.(j))
        | Some r, None -> Some (r @ an.(i))
        | None, None -> None
      in
      dp_tbl.(i).(j) <- Some v;
      v)
;;

(* *)
let ans =
  (* *)
  dp 0 (n - 1) |> Option.value ~default:0 |> Int.to_string
;;

let () = ans |> print_endline
