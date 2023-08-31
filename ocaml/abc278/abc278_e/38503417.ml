//##// Contest ID: abc278
//##// Problem ID: abc278_e ( https://atcoder.jp/contests/abc278/tasks/abc278_e )
//##// Title: E. Grid Filling
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-31 09:30:32 +0000 UTC ( https://atcoder.jp/contests/abc278/submissions/38503417 ) 

open Core
open IterLabels

let hh, ww = Scanf.scanf " %d %d" Tuple2.create
let n, h, w = Scanf.scanf " %d %d %d" Tuple3.create

type t =
  { max_x : int
  ; min_x : int
  ; max_y : int
  ; min_y : int
  }

let max_min = Array.init (n + 1) ~f:(const { max_x = -1; min_x = Int.max_value; max_y = -1; min_y = Int.max_value })

let a =
  Array.init hh ~f:(fun h ->
    Array.init ww ~f:(fun w ->
      let v = Scanf.scanf " %d" Fn.id in
      let { max_x; min_x; max_y; min_y } = max_min.(v) in
      let max_x = Int.max max_x w in
      let min_x = Int.min min_x w in
      let max_y = Int.max max_y h in
      let min_y = Int.min min_y h in
      max_min.(v) <- { max_x; min_x; max_y; min_y };
      v))
;;

let () =
  0 -- (hh - h)
  |> iter ~f:(fun hh ->
       0 -- (ww - w)
       |> iter ~f:(fun ww ->
            1 -- n
            |> filter_count ~f:(fun nn ->
                 let { max_x; min_x; max_y; min_y } = max_min.(nn) in
                 not @@ (ww <= min_x && max_x <= ww + w - 1 && hh <= min_y && max_y <= hh + h - 1))
            |> Printf.printf "%d ");
       print_endline "")
;;
