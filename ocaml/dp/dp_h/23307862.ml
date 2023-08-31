//##// Contest ID: dp
//##// Problem ID: dp_h ( https://atcoder.jp/contests/dp/tasks/dp_h )
//##// Title: H. Grid 1
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-09 06:47:48 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23307862 ) 

open Core

let int_inf = Int.max_value
let id x = x
let get_int () = Scanf.scanf "%d " id
let h = get_int ()
let w = get_int ()

type t =
  | NotYet
  | Value of int
  | Block

let dp_tbl =
  Array.init h ~f:(fun _ ->
      Array.init (w + 1) ~f:(fun _ ->
          Scanf.scanf "%c" (fun x -> if Char.(x = '.') then NotYet else Block)))
;;

let () = dp_tbl.(0).(0) <- Value 1
let do_mod x = x mod (Int.pow 10 9 + 7)

let calc up left =
  match up, left with
  | Value up, Value left -> Value (do_mod (do_mod up + do_mod left))
  | Value up, Block -> Value (do_mod up)
  | Block, Value left -> Value (do_mod left)
  | Block, Block -> Block
  | NotYet, _
  | _, NotYet ->
    invalid_arg "calc"
;;

let rec dp i j =
  if i < 0 || h - 1 < i || j < 0 || w - 1 < j
  then Block
  else (
    match dp_tbl.(i).(j) with
    | NotYet ->
      let v = calc (dp (i - 1) j) (dp i (j - 1)) in
      dp_tbl.(i).(j) <- v;
      v
    | v -> v)
;;

let ans =
  (match dp (h - 1) (w - 1) with
  | Value v -> v
  | Block -> 0
  | NotYet -> invalid_arg "ans")
  |> do_mod
  |> Int.to_string
;;

let () = ans |> print_endline
