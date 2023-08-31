//##// Contest ID: dp
//##// Problem ID: dp_j ( https://atcoder.jp/contests/dp/tasks/dp_j )
//##// Title: J. Sushi
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-14 07:30:25 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23470351 ) 

open! Core
open! Printf
open! Scanf
open! Num

let id x = x

(* *)

let n = scanf "%d " id
let nf = n |> Float.of_int

let dp_tbl =
  Array.init 301 ~f:(fun _ ->
      Array.init 301 ~f:(fun _ -> Array.init 301 ~f:(fun _ -> None)))
;;

let a = Array.init 4 ~f:(fun _ -> 0)

let () =
  for _ = 1 to n do
    scanf "%d " (fun x -> a.(x) <- a.(x) + 1)
  done
;;

let rec dp i j k =
  if i = 0 && j = 0 && k = 0
  then 0.0
  else (
    match dp_tbl.(i).(j).(k) with
    | Some v -> v
    | None ->
      let v =
        let fi = Float.of_int i in
        let fj = Float.of_int j in
        let fk = Float.of_int k in
        let out = 0.0 in
        let out = out +. if i >= 1 then fi *. dp (i - 1) j k else 0.0 in
        let out = out +. if j >= 1 then fj *. dp (i + 1) (j - 1) k else 0.0 in
        let out = out +. if k >= 1 then fk *. dp i (j + 1) (k - 1) else 0.0 in
        let out = out +. nf in
        out /. (fi +. fj +. fk)
      in
      dp_tbl.(i).(j).(k) <- Some v;
      v)
;;

(* *)
let ans =
  (* *)
  dp a.(1) a.(2) a.(3) |> Float.to_string
;;

let () = ans |> print_endline
