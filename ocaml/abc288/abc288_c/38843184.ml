//##// Contest ID: abc288
//##// Problem ID: abc288_c ( https://atcoder.jp/contests/abc288/tasks/abc288_c )
//##// Title: C. Don’t be cycle
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-12 11:59:14 +0000 UTC ( https://atcoder.jp/contests/abc288/submissions/38843184 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Hashtbl.create (module Int)

let () =
  (1 -- m) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u, v = (u - 1, v - 1) in
      Hashtbl.add_multi graph ~key:u ~data:v;
      Hashtbl.add_multi graph ~key:v ~data:u)

let visited = Array.init n ~f:(const false)

let rec dfs cnt ~pre p =
  if visited.(p) then cnt + 1
  else
    let () = visited.(p) <- true in
    Hashtbl.find_multi graph p |> of_list
    |> filter ~f:(( <> ) pre)
    |> fold ~init:cnt ~f:(dfs ~pre:p)

let () =
  let v =
    0 -- (n - 1)
    |> filter_map ~f:(fun p ->
           if visited.(p) then None else Some (dfs 0 ~pre:p p))
    |> sum
  in
  printf "%d\n" (v / 2)
