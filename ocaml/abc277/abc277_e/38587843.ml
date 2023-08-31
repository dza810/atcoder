//##// Contest ID: abc277
//##// Problem ID: abc277_e ( https://atcoder.jp/contests/abc277/tasks/abc277_e )
//##// Title: E. Crystal Switches
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-04 07:23:05 +0000 UTC ( https://atcoder.jp/contests/abc277/submissions/38587843 ) 

[@@@landmarks "all"]

open Core
open IterLabels
module ISet = Set.Make (Int)

let n, m, k = Scanf.scanf " %d %d %d" Tuple3.create
let graph = Hashtbl.create (module Int)
let a = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))

let () =
  (1 -- m) (fun _ ->
    let u, v, aa = Scanf.scanf " %d %d %d" Tuple3.create in
    let u, v = u - 1, v - 1 in
    Hashtbl.add_multi graph ~key:u ~data:v;
    Hashtbl.add_multi graph ~key:v ~data:u;
    Hashtbl.update a (v, u) ~f:(function
      | None -> ISet.singleton aa
      | Some v -> ISet.add aa v);
    Hashtbl.update a (u, v) ~f:(function
      | None -> ISet.singleton aa
      | Some v -> ISet.add aa v))
;;

let s = Array.create ~len:n false

let () =
  1 -- k
  |> iter ~f:(fun _ ->
       let v = Scanf.scanf " %d" (fun x -> x - 1) in
       s.(v) <- true)
;;

module IntHeap = CCHeap.Make (struct
  type t = int * int

  let leq (a, _) (b, _) = a <= b
end)

let dijistra () =
  let dist = Array.create ~len:(2 * n) Int.max_value_30_bits in
  let init = (0 * 2) + 1 in
  let () = dist.(init) <- 0 in
  let q = IntHeap.empty in
  let q = IntHeap.add q (0, init) in
  let rec aux q =
    match IntHeap.take q with
    | None -> Int.min dist.(2 * (n - 1)) dist.((2 * (n - 1)) + 1)
    | Some (q, (_, v)) ->
      let i = v / 2 in
      let sw = v % 2 in
      let q =
        if s.(i)
        then (
          let vv = (i * 2) + ((sw + 1) % 2) in
          if dist.(vv) > dist.(v)
          then (
            dist.(vv) <- dist.(v);
            IntHeap.add q (dist.(vv), vv))
          else q)
        else q
      in
      let[@landmark] vs = Hashtbl.find_multi graph i in
      let[@landmark] vs =
        vs |> List.filter ~f:(fun j -> ISet.mem sw (Hashtbl.find_exn a (i, j)))
      in
      let q =
        vs
        |> List.fold ~init:q ~f:(fun q j ->
             let vv = (j * 2) + (sw % 2) in
             if dist.(vv) > dist.(v) + 1
             then (
               dist.(vv) <- dist.(v) + 1;
               IntHeap.add q (dist.(vv), vv))
             else q)
      in
      aux q
  in
  aux q
;;

let () =
  dijistra ()
  |> (fun x -> if x >= Int.max_value_30_bits then -1 else x)
  |> Printf.printf "%d\n"
;;
