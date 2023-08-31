//##// Contest ID: abc269
//##// Problem ID: abc269_d ( https://atcoder.jp/contests/abc269/tasks/abc269_d )
//##// Title: D. Do use hexagon grid
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-09 10:00:03 +0000 UTC ( https://atcoder.jp/contests/abc269/submissions/38734582 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let mem = Array.make_matrix ~dimx:2020 ~dimy:2020 (-1)

module UnionFind = struct
  type t =
    { par : int -> int
    ; union : int -> int -> unit
    ; _par : int array
    }

  let rec par _par x =
    let p = _par.(x) in
    if p <> x then _par.(x) <- par _par p;
    _par.(x)
  ;;

  let union _par x y =
    let x = par _par x in
    let y = par _par y in
    let x, y = Int.(min x y, max x y) in
    _par.(x) <- y;
    ignore @@ par _par y
  ;;

  let create size =
    let _par = Array.init size ~f:Fn.id in
    let par = par _par in
    let union = union _par in
    { par; union; _par }
  ;;
end

let unionfind = UnionFind.create (n + 1)

let xy =
  Array.init n ~f:(fun i ->
    let x, y = Scanf.scanf " %d %d" Tuple2.create in
    let x, y = x + 1010, y + 1010 in
    mem.(x).(y) <- i;
    x, y)
;;

let () =
  0 -- (n - 1)
  |> iter ~f:(fun i ->
       [ -1, -1; -1, 0; 0, -1; 0, 1; 1, 0; 1, 1 ]
       |> List.iter ~f:(fun (dx, dy) ->
            let j = mem.(fst xy.(i) + dx).(snd xy.(i) + dy) in
            if j <> -1 then unionfind.union i j))
;;

module Set = Core.Set.Poly

let () =
  0 -- (n - 1) |> filter_count ~f:(fun i -> i = unionfind.par i) |> Printf.printf "%d\n"
;;
