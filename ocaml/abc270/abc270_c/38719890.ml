//##// Contest ID: abc270
//##// Problem ID: abc270_c ( https://atcoder.jp/contests/abc270/tasks/abc270_c )
//##// Title: C. Simple path
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-08 14:35:19 +0000 UTC ( https://atcoder.jp/contests/abc270/submissions/38719890 ) 

open Core
open IterLabels

let n, x, y = Scanf.scanf " %d %d %d" Tuple3.create
let graph = Hashtbl.create (module Int)

let () =
  (1 -- (n - 1)) (fun _ ->
    let u, v = Scanf.scanf " %d %d" Tuple2.create in
    Hashtbl.add_multi graph ~key:u ~data:v;
    Hashtbl.add_multi graph ~key:v ~data:u)
;;

let rec dfs r path pre p =
  let path = p :: path in
  Hashtbl.find_multi graph p
  |> List.filter ~f:(( <> ) pre)
  |> List.iter ~f:(fun pp ->
       if pp = y
       then (
         List.iter ~f:(fun v -> Printf.printf "%d " v) @@ List.rev path;
         printf "%d\n" y;
         r.return ())
       else dfs r path p pp)
;;

let () = with_return (fun r -> dfs r [] x x)