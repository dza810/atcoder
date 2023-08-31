//##// Contest ID: abc284
//##// Problem ID: abc284_e ( https://atcoder.jp/contests/abc284/tasks/abc284_e )
//##// Title: E. Count Simple Paths
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-07 01:10:29 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/38683169 ) 

open Core
open IterLabels

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
let ans = ref 0

let rec dfs r p =
  if visited.(p)
  then ()
  else (
    let () = visited.(p) <- true in
    let () = Int.incr ans in
    let () =
      Hashtbl.find_multi graph p
      |> of_list
      |> filter ~f:(fun pp -> not @@ visited.(pp))
      |> iter ~f:(dfs r)
    in
    if !ans >= 1_000_000
    then r.return ()
    else (
      let () = visited.(p) <- false in
      ()))
;;

let () =
  with_return (fun r -> dfs r 0);
  Printf.printf "%d\n" @@ Int.min 1_000_000 !ans
;;
