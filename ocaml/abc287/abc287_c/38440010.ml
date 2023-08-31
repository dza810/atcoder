//##// Contest ID: abc287
//##// Problem ID: abc287_c ( https://atcoder.jp/contests/abc287/tasks/abc287_c )
//##// Title: C. Path Graph?
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-29 03:52:40 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38440010 ) 

open Core
open IterLabels

let ( @. ) f g x = f (g x)
let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Array.create ~len:n []
let deg = Array.create ~len:n 0

let () =
  for _ = 1 to m do
    let u, v = Scanf.scanf " %d %d" Tuple2.create in
    let u, v = u - 1, v - 1 in
    graph.(u) <- v :: graph.(u);
    graph.(v) <- u :: graph.(v);
    deg.(u) <- 1 + deg.(u);
    deg.(v) <- 1 + deg.(v)
  done
;;

let visited = Array.create ~len:n false

let rec dfs r pre p =
  if visited.(p)
  then r.return false
  else (
    visited.(p) <- true;
    graph.(p) |> List.filter ~f:(( <> ) pre) |> List.iter ~f:(ignore @. dfs r p);
    true)
;;

let () =
  let p1 = Array.filter ~f:(( = ) 1) deg in
  let c2 = Array.count ~f:(( = ) 2) deg in
  let c1 = Array.length p1 in
  if c1 <> 2 || c2 <> n - 2
  then print_endline "No"
  else
    print_endline
    @@
    if with_return (fun r -> dfs r p1.(1) p1.(1)) && Array.for_all ~f:Fn.id visited
    then "Yes"
    else "No"
;;
