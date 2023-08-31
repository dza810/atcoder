//##// Contest ID: abc278
//##// Problem ID: abc278_d ( https://atcoder.jp/contests/abc278/tasks/abc278_d )
//##// Title: D. All Assign Point Add
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-31 08:43:55 +0000 UTC ( https://atcoder.jp/contests/abc278/submissions/38502490 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id

module IMap = Map.Make (Int)

let map = 1 -- n |> map ~f:(fun _ -> Scanf.scanf " %d" Fn.id)|> persistent |> foldi ~init:IMap.empty ~f:(fun map i v -> IMap.add (i + 1) v map) 
let q = Scanf.scanf " %d" Fn.id

let () =
  let f (map, all) _ =
    match Scanf.scanf " %d" Fn.id with
    | 1 ->
      let map = IMap.empty in
      let all = Scanf.scanf " %d" Fn.id in
      map, all
    | 2 ->
      let i, x = Scanf.scanf " %d %d" Tuple2.create in
      let map =
        IMap.update
          i
          (function
           | None -> Some x
           | Some v -> Some (v + x))
          map
      in
      map, all
    | 3 ->
      let i = Scanf.scanf " %d" Fn.id in
      let v = IMap.find_opt i map |> Option.value ~default:0 in
      Printf.printf "%d\n" @@ (all + v);
      map, all
    | _ -> failwith "invalid"
  in
  let init = map, 0 in
  1 -- q |> fold ~init ~f |> ignore
;;
