//##// Contest ID: abc287
//##// Problem ID: abc287_c ( https://atcoder.jp/contests/abc287/tasks/abc287_c )
//##// Title: C. Path Graph?
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-29 04:59:52 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38441363 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Array.create ~len:n []
let deg = Array.create ~len:n 0

let () =
  (1 -- m) (fun _ ->
    let u, v = Scanf.scanf " %d %d" Tuple2.create in
    let u, v = u - 1, v - 1 in
    graph.(u) <- v :: graph.(u);
    graph.(v) <- u :: graph.(v);
    deg.(u) <- 1 + deg.(u);
    deg.(v) <- 1 + deg.(v))
;;

let visited = Array.create ~len:n false

let rec check pre p =
  if visited.(p)
  then false
  else (
    let () = visited.(p) <- true in
    match graph.(p) |> List.filter ~f:(( <> ) pre) with
    | [ pp ] -> check p pp
    | [] -> Array.for_all ~f:Fn.id visited
    | l -> false)
;;

let () =
  let c1 = Array.count ~f:(( = ) 1) deg in
  let c2 = Array.count ~f:(( = ) 2) deg in
  print_endline
  @@
  if c1 = 2 && c2 = n - 2
  then (
    let p, _ = Array.findi_exn ~f:(fun _ v -> v = 1) deg in
    if check p p then "Yes" else "No")
  else "No"
;;
