//##// Contest ID: abc274
//##// Problem ID: abc274_d ( https://atcoder.jp/contests/abc274/tasks/abc274_d )
//##// Title: D. Robot Arms 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-07 11:39:55 +0000 UTC ( https://atcoder.jp/contests/abc274/submissions/38693104 ) 

open Core
open IterLabels
module ISet = Set.Make (Int)

let n = Scanf.scanf " %d" Fn.id
let xx, yy = Scanf.scanf " %d %d" Tuple2.create
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)

let () =
  a
  |> Array.foldi
       ~init:(ISet.singleton a.(0), ISet.singleton 0)
       ~f:(fun i (x, y) a ->
        if i = 0 then (x,y) else
         let open ISet in
         if i % 2 = 0
         then (
           let v1 = ISet.map (fun x -> x + a) x in
           let v2 = ISet.map (fun x -> x - a) x in
           union v1 v2, y)
         else (
           let v1 = ISet.map (fun y -> y + a) y in
           let v2 = ISet.map (fun y -> y - a) y in
           x, union v1 v2))
  |> fun (x, y) ->
  ISet.(mem xx x && mem yy y) |> fun flg -> print_endline @@ if flg then "Yes" else "No"
;;
