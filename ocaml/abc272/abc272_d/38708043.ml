//##// Contest ID: abc272
//##// Problem ID: abc272_d ( https://atcoder.jp/contests/abc272/tasks/abc272_d )
//##// Title: D. Root M Leaper
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-08 05:10:11 +0000 UTC ( https://atcoder.jp/contests/abc272/submissions/38708043 ) 

open IterLabels
open Core
module Set = Core.Set.Poly

let () = print_endline ""
let n, m = Scanf.scanf " %d %d" Tuple2.create
let step = 1000
let p i j = (i * step) + j
let ip k = k / step, k % step
let graph = Hashtbl.create (module Int)

(* let rec bin_search ~f l r =
  if r - l <= 1
  then l
  else (
    let c = ((r - l) / 2) + l in
    if f c then bin_search ~f c r else bin_search ~f l c)
;;

let int_sqrt = function
  | 0 -> Some 0
  | x when x < 0 -> None
  | x ->
    let sq_x = bin_search ~f:(fun c -> c * c <= x) 0 (x + 1) in
    if sq_x * sq_x = x then Some sq_x else None
;; *)

let sqrt = Array.init (m + 1) ~f:(const None)
let () = 0 -- m |> iter ~f:(fun i -> if i * i <= m then sqrt.(i * i) <- Some i)
let visited = Array.make_matrix ~dimx:step ~dimy:step false

let rec loop (i, j) =
  if visited.(i).(j)
  then ()
  else (
    let () = visited.(i).(j) <- true in
    1 -- n
    |> iter ~f:(fun k ->
         let vv = m - ((i - k) * (i - k)) in
         if vv < 0
         then ()
         else (
           match sqrt.(vv) with
           | None -> ()
           | Some vv ->
             doubleton (j - vv) (j + vv) (fun l ->
               if 1 <= l && l <= n
               then (
                 Hashtbl.add_multi graph ~key:(p i j) ~data:(p k l);
                 loop (k, l))))))
;;

let () = loop (1, 1)

let dijistra () =
  let dist = Array.make_matrix ~dimx:step ~dimy:step Int.max_value in
  let () = dist.(1).(1) <- 0 in
  let q = Set.singleton (0, p 1 1) in
  let rec aux q =
    match Set.min_elt q with
    | None -> ()
    | Some (c, pp) ->
      let q = Set.remove q (c, pp) in
      let i, j = ip pp in
      let q =
        Hashtbl.find_multi graph (p i j)
        |> List.fold ~init:q ~f:(fun q pp ->
             let k, l = ip pp in
             if c + 1 < dist.(k).(l)
             then (
               dist.(k).(l) <- c + 1;
               Set.add q (dist.(k).(l), p k l))
             else q)
      in
      aux q
  in
  aux q;
  dist
;;

let () =
  let dist = dijistra () in
  (1 -- n) (fun i ->
    (1 -- n) (fun j ->
      (if j = n then printf "%d\n" else printf "%d ")
      @@ if dist.(i).(j) = Int.max_value then -1 else dist.(i).(j)))
;;
