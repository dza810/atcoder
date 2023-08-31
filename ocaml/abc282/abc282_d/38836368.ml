//##// Contest ID: abc282
//##// Problem ID: abc282_d ( https://atcoder.jp/contests/abc282/tasks/abc282_d )
//##// Title: D. Make Bipartite 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-12 06:36:10 +0000 UTC ( https://atcoder.jp/contests/abc282/submissions/38836368 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Array.create ~len:n []
let color = Array.create ~len:n 0
let color_count = Array.init ((2 * n) + 2) ~f:(const 0)

let () =
  (1 -- m) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u, v = (u - 1, v - 1) in
      graph.(u) <- v :: graph.(u);
      graph.(v) <- u :: graph.(v))

let rec colorize ~c p =
  if color.(p) = 0 then (
    color.(p) <- c;
    graph.(p)
    |> List.fold ~init:(1, 0) ~f:(fun (b, r) pp ->
           let rr, bb = colorize ~c:(-c) pp in
           (b + bb, r + rr)))
  else if color.(p) <> c then (
    print_endline "0";
    exit 0)
  else (0, 0)

let () =
  let count =
    0 -- (n - 1)
    |> filter ~f:(fun p -> color.(p) = 0)
    |> map ~f:(fun p ->
           let b, r = colorize ~c:(p + 1) p in
           (b * (b - 1) / 2) + (r * (r - 1) / 2))
    |> sum
  in
  Printf.printf "%d\n" @@ ((n * (n - 1) / 2) - count - m)
