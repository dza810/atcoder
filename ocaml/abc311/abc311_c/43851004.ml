//##// Contest ID: abc311
//##// Problem ID: abc311_c ( https://atcoder.jp/contests/abc311/tasks/abc311_c )
//##// Title: C. Find it!
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-22 12:31:08 +0000 UTC ( https://atcoder.jp/contests/abc311/submissions/43851004 ) 

open IterLabels
open Core

let n = Scanf.scanf " %d" Fn.id
let graph = Hashtbl.create (module Int)

let () =
  (1 -- n) (fun u ->
      let v = Scanf.scanf " %d" Fn.id in
      Hashtbl.add_multi graph ~key:u ~data:v)

let dfs i =
  let visited = Array.init (n + 1) ~f:(Fn.const false) in
  let rec aux acc i =
    if visited.(i) then Some (i :: acc)
    else (
      visited.(i) <- true;
      Hashtbl.find_multi graph i |> List.find_map ~f:(aux (i :: acc)))
  in
  aux [] i

let () =
  let ans =
    Option.value_exn (1 -- n |> find_map ~f:dfs) |> List.hd_exn |> dfs
  in
  let ans = List.tl_exn @@ List.rev @@ Option.value_exn ans in
  Printf.printf "%d\n" @@ List.length ans;
  List.iter ~f:(fun v -> Printf.printf "%d " v) ans
