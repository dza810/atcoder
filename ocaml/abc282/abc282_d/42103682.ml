//##// Contest ID: abc282
//##// Problem ID: abc282_d ( https://atcoder.jp/contests/abc282/tasks/abc282_d )
//##// Title: D. Make Bipartite 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-09 16:38:21 +0000 UTC ( https://atcoder.jp/contests/abc282/submissions/42103682 ) 

open IterLabels
open Core

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Hashtbl.create (module Int)

let () =
  (1 -- m) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u, v = (u - 1, v - 1) in
      Hashtbl.add_multi graph ~key:u ~data:v;
      Hashtbl.add_multi graph ~key:v ~data:u)

let color = Array.create ~len:n 0

let rec colorize ~c x =
  if color.(x) = 0 then (
    color.(x) <- c;
    Hashtbl.find_multi graph x
    |> List.fold ~init:(1, 0) ~f:(fun (p, n) y ->
           let nn, pp = colorize ~c:(-c) y in
           (p + pp, n + nn)))
  else if color.(x) <> c then (
    printf "0\n";
    exit 0)
  else (0, 0)

let count =
  0 -- (n - 1)
  |> filter ~f:(fun i -> color.(i) = 0)
  |> map ~f:(fun i -> colorize ~c:(i + 1) i)
  |> map ~f:(fun (p, n) -> (p * (p - 1) / 2) + (n * (n - 1) / 2))
  |> sum

let () = printf "%d\n" @@ ((n * (n - 1) / 2) - count - m)
