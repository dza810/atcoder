//##// Contest ID: abc289
//##// Problem ID: abc289_e ( https://atcoder.jp/contests/abc289/tasks/abc289_e )
//##// Title: E. Swap Places
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-12 04:07:16 +0000 UTC ( https://atcoder.jp/contests/abc289/submissions/38833410 ) 

open Core
open IterLabels
module ISet = Set.Make (Int)

let t = Scanf.scanf " %d" Fn.id

let main _ =
  let n, m = Scanf.scanf " %d %d" Tuple2.create in
  let c = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id) in
  let graph = Array.make_matrix ~dimx:2 ~dimy:n [] in
  let () =
    (1 -- m) (fun _ ->
        let u, v = Scanf.scanf " %d %d" Tuple2.create in
        let u, v = (u - 1, v - 1) in
        graph.(c.(v)).(u) <- v :: graph.(c.(v)).(u);
        graph.(c.(u)).(v) <- u :: graph.(c.(u)).(v))
  in
  let q = Queue.singleton (0, n - 1) in
  let dist = Array.make_matrix ~dimx:n ~dimy:n (-1) in
  let () = dist.(0).(n - 1) <- 0 in
  let rec aux () =
    match Queue.dequeue q with
    | None -> dist.(n - 1).(0)
    | Some (px, py) ->
        let () =
          (0 -- 1) (fun c ->
              graph.(c).(px)
              |> List.iter ~f:(fun x ->
                     graph.(1 - c).(py)
                     |> List.iter ~f:(fun y ->
                            if dist.(x).(y) = -1 then (
                              dist.(x).(y) <- dist.(px).(py) + 1;
                              Queue.enqueue q (x, y)))))
        in
        aux ()
  in
  Printf.printf "%d\n" @@ aux ()

let () = (1 -- t) main
