//##// Contest ID: abc284
//##// Problem ID: abc284_e ( https://atcoder.jp/contests/abc284/tasks/abc284_e )
//##// Title: E. Count Simple Paths
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-28 07:28:53 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/38368807 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Array.create ~len:n []

let () =
  for _ = 1 to m do
    let u, v = Scanf.scanf " %d %d" Tuple2.create in
    let u, v = u - 1, v - 1 in
    graph.(v) <- u :: graph.(v);
    graph.(u) <- v :: graph.(u)
  done
;;

let visited = Array.create ~len:n false

let rec dfs r p =
  if visited.(p)
  then 0
  else (
    visited.(p) <- true;
    let v =
      graph.(p)
      |> List.fold ~init:1 ~f:(fun acc v ->
           let acc = acc + dfs r v in
           if acc >= 1_000_000 then r.return 1_000_000 else acc)
    in
    visited.(p) <- false;
    v)
;;

let () = Printf.printf "%d\n" @@ with_return (fun r -> dfs r 0)
