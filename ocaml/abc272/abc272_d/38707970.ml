//##// Contest ID: abc272
//##// Problem ID: abc272_d ( https://atcoder.jp/contests/abc272/tasks/abc272_d )
//##// Title: D. Root M Leaper
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-08 05:04:26 +0000 UTC ( https://atcoder.jp/contests/abc272/submissions/38707970 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let step = 410
let dist = Array.make_matrix ~dimx:step ~dimy:step (-1)
let sqrts = Array.init (m + 1) ~f:(const None)
let () = 0 -- m |> iter ~f:(fun i -> if i * i <= m then sqrts.(i * i) <- Some i)

let bfs () =
  let () = dist.(1).(1) <- 0 in
  let q = Queue.singleton (1, 1) in
  let rec loop () =
    match Queue.dequeue q with
    | None -> ()
    | Some (i, j) ->
      1 -- n
      |> filter_map ~f:(fun k ->
        let vv = m - ((i - k) * (i - k)) in
        if vv < 0 then None else
           match sqrts.(vv) with
           | None -> None
           | Some v -> Some (k, v))
      |> flat_map ~f:(fun (k, v) ->
           if v = 0 then singleton (k, j) else doubleton (k, j + v) (k, j - v))
      |> filter ~f:(fun (_, l) -> 1 <= l && l <= n)
      |> iter ~f:(fun (k, v) ->
           if dist.(k).(v) = -1 || dist.(i).(j) + 1 < dist.(k).(v)
           then (
             let () = dist.(k).(v) <- dist.(i).(j) + 1 in
             let () = Queue.enqueue q (k, v) in
             ()));
      loop ()
  in
  loop ();
  dist
;;

let () =
  let dist = bfs () in
  (1 -- n) (fun i ->
    (1 -- n) (fun j -> (if j = n then printf "%d\n" else printf "%d ") @@ dist.(i).(j)))
;;
