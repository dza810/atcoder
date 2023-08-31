//##// Contest ID: abc277
//##// Problem ID: abc277_e ( https://atcoder.jp/contests/abc277/tasks/abc277_e )
//##// Title: E. Crystal Switches
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-04 07:08:18 +0000 UTC ( https://atcoder.jp/contests/abc277/submissions/38587450 ) 

open Core
open IterLabels

let n, m, k = Scanf.scanf " %d %d %d" Tuple3.create
let graph = Hashtbl.create (module Int)

let () =
  (1 -- m) (fun _ ->
    let u, v, a = Scanf.scanf " %d %d %d" Tuple3.create in
    let u, v = u - 1, v - 1 in
    let u, v = (u * 2) + a, (v * 2) + a in
    Hashtbl.add_multi graph ~key:u ~data:(v, 1);
    Hashtbl.add_multi graph ~key:v ~data:(u, 1))
;;

let () =
  (1 -- k) (fun _ ->
    let x = Scanf.scanf " %d" (fun x -> x - 1) in
    let a, b = (x * 2) + 0, (x * 2) + 1 in
    Hashtbl.add_multi graph ~key:a ~data:(b, 0);
    Hashtbl.add_multi graph ~key:b ~data:(a, 0))
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
      let q =
        Hashtbl.find_multi graph v
        |> List.fold ~init:q ~f:(fun q (u, c) ->
             if dist.(u) > dist.(v) + c
             then (
               dist.(u) <- dist.(v) + c;
               IntHeap.add q (dist.(u), u))
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
