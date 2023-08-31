//##// Contest ID: dp
//##// Problem ID: dp_c ( https://atcoder.jp/contests/dp/tasks/dp_c )
//##// Title: C. Vacation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-12-20 16:29:58 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/28039667 ) 

open Core
open Printf
open Scanf
open Num

let id x = x

(* *)

let n = scanf "%d " id
let xs = Array.init n ~f:(fun _ -> Array.init 3 ~f:(fun _ -> scanf "%d " id))
let a i = xs.(i - 1).(0)
let b i = xs.(i - 1).(1)
let c i = xs.(i - 1).(2)
let dp = Array.init (n + 1) ~f:(fun _ -> None)

(* *)
let rec happiness i =
  if i = 0
  then Some (0, 0, 0)
  else (
    match dp.(i) with
    | Some x -> Some x
    | None ->
      let out =
        Option.map
          (happiness (i - 1))
          ~f:(fun (pa, pb, pc) ->
            let a = a i in
            let b = b i in
            let c = c i in
            a + max pb pc, b + max pa pc, c + max pa pb)
      in
      dp.(i) <- out;
      out)
;;

let () =
  happiness n
  |> Option.value ~default:(-1, -1, -1)
  |> fun (a, b, c) -> printf "%d\n" (max a @@ max b c)
;;
