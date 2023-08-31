//##// Contest ID: abc304
//##// Problem ID: abc304_d ( https://atcoder.jp/contests/abc304/tasks/abc304_d )
//##// Title: D. A Piece of Cake
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-05 12:46:15 +0000 UTC ( https://atcoder.jp/contests/abc304/submissions/42022036 ) 

open Core
open IterLabels

let w, h = Scanf.scanf " %d %d" Tuple2.create
let n = Scanf.scanf " %d" Fn.id
let pq = Array.init n ~f:(fun _ -> Scanf.scanf " %d %d" Tuple2.create)
let a = Scanf.scanf " %d" Fn.id
let aa = Array.init a ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let b = Scanf.scanf " %d" Fn.id
let bb = Array.init b ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let tbl = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))
let count = ref 0

let () =
  pq
  |> Array.iter ~f:(fun (p, q) ->
         let pi =
           Array.binary_search aa ~compare:Int.compare `First_greater_than_or_equal_to
             p
         in
         let qi =
           Array.binary_search bb ~compare:Int.compare `First_greater_than_or_equal_to
             q
         in
         let pi = pi |> Option.value ~default:a in
         let qi = qi |> Option.value ~default:b in
         let () = eprintf "% 3d -> % 3d | % 3d -> % 3d\n" p pi q qi in
         Hashtbl.update tbl (pi, qi) ~f:(function
           | None ->
               incr count;
               1
           | Some x -> succ x))

let () =
  let vs =
    tbl
    |> Hashtbl.fold ~init:(Int.max_value_30_bits, Int.min_value)
         ~f:(fun ~key:_ ~data acc ->
           ( (if data < fst acc then data else fst acc),
             if data > snd acc then data else snd acc ))
  in
  let min = if (a + 1) * (b + 1) - !count > 0 then 0 else fst vs in
  printf "%d %d\n" min (snd vs)
