//##// Contest ID: abc288
//##// Problem ID: abc288_c ( https://atcoder.jp/contests/abc288/tasks/abc288_c )
//##// Title: C. Don’t be cycle
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-04 13:37:18 +0000 UTC ( https://atcoder.jp/contests/abc288/submissions/38623419 ) 

open IterLabels
open Core

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Hashtbl.create (module Int)

let () =
  (1 -- m) (fun _ ->
    let u, v = Scanf.scanf " %d %d" Tuple2.create in
    let u, v = u - 1, v - 1 in
    Hashtbl.add_multi graph ~key:u ~data:v;
    Hashtbl.add_multi graph ~key:v ~data:u)
;;

let visited = Array.init n ~f:(const false)

let rec dfs pre p =
  if visited.(p)
  then 1
  else (
    let () = visited.(p) <- true in
    let ans =
      Hashtbl.find_multi graph p
      |> List.filter ~f:(( <> ) pre)
      |> List.fold ~init:0 ~f:(fun s pp -> s + dfs p pp)
    in
    ans)
;;

let () =
  0 -- (n - 1)
  |> filter ~f:(fun p -> not @@ visited.(p))
  |> fold ~init:0 ~f:(fun s p -> s + dfs p p)
  |> fun x -> x / 2 |> Printf.printf "%d\n"
;;
