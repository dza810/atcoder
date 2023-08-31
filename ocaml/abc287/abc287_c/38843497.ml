//##// Contest ID: abc287
//##// Problem ID: abc287_c ( https://atcoder.jp/contests/abc287/tasks/abc287_c )
//##// Title: C. Path Graph?
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-12 12:12:10 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38843497 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Hashtbl.create (module Int)
let deg = Array.init n ~f:(const 0)

let () =
  (1 -- m) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u, v = (u - 1, v - 1) in
      Hashtbl.add_multi graph ~key:u ~data:v;
      deg.(u) <- 1 + deg.(u);
      deg.(v) <- 1 + deg.(v);
      Hashtbl.add_multi graph ~key:v ~data:u)

let visited = Array.init n ~f:(const false)

let rec dfs r ~pre p =
  if visited.(p) then r.return false
  else
    let () = visited.(p) <- true in
    Hashtbl.find_multi graph p |> of_list
    |> filter ~f:(( <> ) pre)
    |> for_all ~f:(dfs r ~pre:p)

let () =
  let c1 =
    Array.filter_mapi deg ~f:(fun i v -> if v = 1 then Some i else None)
  in
  let c2 = Array.count deg ~f:(( = ) 2) in
  print_endline
  @@
  if
    Array.length c1 = 2
    && c2 = n - 2
    && with_return (fun r -> dfs r ~pre:c1.(0) c1.(0))
    && Array.for_all ~f:Fn.id visited
  then "Yes"
  else "No"
