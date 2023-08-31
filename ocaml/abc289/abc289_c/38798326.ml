//##// Contest ID: abc289
//##// Problem ID: abc289_c ( https://atcoder.jp/contests/abc289/tasks/abc289_c )
//##// Title: C. Coverage
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-11 12:32:55 +0000 UTC ( https://atcoder.jp/contests/abc289/submissions/38798326 ) 

open Core
open IterLabels
module ISet = Set.Make (Int)

let n, m = Scanf.scanf " %d %d" Tuple2.create

let s =
  Array.init m ~f:(fun _ ->
      let c = Scanf.scanf " %d" Fn.id in
      1 -- c |> map ~f:(fun _ -> Scanf.scanf " %d" Fn.id) |> ISet.of_iter)

let v =
  1 -- ((1 lsl m) - 1)
  |> map ~f:(fun i ->
         let set =
           1 -- m
           |> filter ~f:(fun mm -> i land (1 lsl (mm - 1)) > 0)
           |> map ~f:(fun mm -> s.(mm - 1))
           |> fold ~init:ISet.empty ~f:ISet.union
         in
         1 -- n |> for_all ~f:(fun nn -> ISet.mem nn set)) 
  |> filter_count ~f:Fn.id

let () = Printf.printf "%d\n" @@ v
