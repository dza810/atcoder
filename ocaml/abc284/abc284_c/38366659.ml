//##// Contest ID: abc284
//##// Problem ID: abc284_c ( https://atcoder.jp/contests/abc284/tasks/abc284_c )
//##// Title: C. Count Connected Components
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-28 05:57:44 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/38366659 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" (fun x y -> (x, y))
let graph = Array.create ~len:n []

let uv =
  1 -- m
  |> iter ~f:(fun _ ->
         let u, v = Scanf.scanf " %d %d" (fun x y -> (x, y)) in
         let u , v = u - 1, v - 1 in
         graph.(u) <- v :: graph.(u);
         graph.(v) <- u :: graph.(v))

let visited = Array.init n ~f:(fun _ -> false)

let rec dfs1 init p =
  if visited.(p) then init
  else
    let () = visited.(p) <- true in
    let init = graph.(p) |> List.fold ~init ~f:(fun acc pp -> dfs1 acc pp) in
    p :: init

let visited = Array.init n ~f:(fun _ -> false)

let rec dfs2 p =
  if visited.(p) then ()
  else
    let () = visited.(p) <- true in
    let init = graph.(p) |> List.iter ~f:(fun pp -> dfs2 pp) in
    ()

let () =
  let p = 0 -- (n - 1) |> fold ~init:[] ~f:(fun acc i -> dfs1 acc i) in
  let cnt =
    p
    |> List.fold ~init:0 ~f:(fun acc p ->
           let acc = acc + if not visited.(p) then 1 else 0 in
           dfs2 p;
           acc)
  in
  Printf.printf "%d\n" cnt
