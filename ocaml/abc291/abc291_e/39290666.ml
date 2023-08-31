//##// Contest ID: abc291
//##// Problem ID: abc291_e ( https://atcoder.jp/contests/abc291/tasks/abc291_e )
//##// Title: E. Find Permutation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-27 09:48:44 +0000 UTC ( https://atcoder.jp/contests/abc291/submissions/39290666 ) 

open IterLabels
open Core
module Set = Set.Make (Int)

let n, m = Scanf.scanf " %d %d" Tuple2.create
let graph = Hashtbl.create (module Int)
let deg = Array.create ~len:n 0
let ans = Array.create ~len:n 0

let () =
  (1 -- m) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u, v = (u - 1, v - 1) in
      deg.(v) <- deg.(v) + 1;
      Hashtbl.add_multi graph ~key:u ~data:v)

let rec loop s v =
  if Set.length s = 1 then (
    let p = Set.min_elt_exn s in
    let s = Set.remove s p in
    ans.(p) <- v;
    let v = v + 1 in
    let s =
      Hashtbl.find_multi graph p
      |> List.fold ~init:s ~f:(fun s pp ->
             deg.(pp) <- deg.(pp) - 1;
             if deg.(pp) = 0 then Set.add s pp else s)
    in
    loop s v)
  else if v = n + 1 then true
  else false

let () =
  let s =
    Array.filter_mapi deg ~f:(fun i x -> if x = 0 then Some i else None)
    |> Set.of_array
  in
  print_endline "";
  if loop s 1 then (
    print_endline "Yes";
    Array.iter ans ~f:(fun x ->
        printf "%d " x);
        print_endline "")
  else print_endline "No"
