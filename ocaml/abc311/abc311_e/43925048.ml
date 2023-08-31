//##// Contest ID: abc311
//##// Problem ID: abc311_e ( https://atcoder.jp/contests/abc311/tasks/abc311_e )
//##// Title: E. Defect-free Squares
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-24 07:18:13 +0000 UTC ( https://atcoder.jp/contests/abc311/submissions/43925048 ) 

open IterLabels
open Core

let h, w, n = Scanf.scanf " %d %d %d" Tuple3.create
let tbl = Array.make_matrix ~dimx:h ~dimy:w true

let () =
  (1 -- n) (fun _ ->
      let a, b = Scanf.scanf " %d %d" Tuple2.create in
      let a, b = (a - 1, b - 1) in
      tbl.(a).(b) <- false)

let () =
  let cache = Array.make_matrix ~dimx:h ~dimy:w 1 in
  let get i j =
    if 0 <= i && i < h && 0 <= j && j < w && tbl.(i).(j) then cache.(i).(j)
    else 0
  in
  0 -- (h - 1)
  |> fold ~init:0 ~f:(fun ans i ->
         0 -- (w - 1)
         |> filter ~f:(Array.get tbl.(i))
         |> fold ~init:ans ~f:(fun ans j ->
                cache.(i).(j) <-
                  1
                  + ([ get (i - 1) j; get i (j - 1); get (i - 1) (j - 1) ]
                    |> of_list |> Iter.min_exn ?lt:None);
                ans + cache.(i).(j)))
  |> Printf.printf "%d\n"
