//##// Contest ID: abc304
//##// Problem ID: abc304_e ( https://atcoder.jp/contests/abc304/tasks/abc304_e )
//##// Title: E. Good Graph
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-06 08:40:16 +0000 UTC ( https://atcoder.jp/contests/abc304/submissions/42037265 ) 

open IterLabels
open Core

module Int2 = struct
  type t = int * int

  include Tuple.Comparable (Int) (Int)
end

let n, m = Scanf.scanf " %d %d" Tuple2.create
let uf = Array.init (n + 10) ~f:Union_find.create

let () =
  (1 -- m) (fun _ ->
      Scanf.scanf " %d %d" (fun u v -> Union_find.union uf.(u) uf.(v)))

let k = Scanf.scanf " %d" Fn.id

let xy =
  1 -- k
  |> fold
       ~init:(Set.empty (module Int2))
       ~f:(fun set _ ->
         Scanf.scanf " %d %d" (fun x y ->
             let x, y = Union_find.(get uf.(x), get uf.(y)) in
             Set.add set (x, y)))

let q = Scanf.scanf " %d" Fn.id

let calc () =
  let p, q =
    Scanf.scanf " %d %d" (fun x y -> Union_find.(get uf.(x), get uf.(y)))
  in
  let flg = Set.mem xy (p, q) || Set.mem xy (q, p) in
  print_endline @@ if flg then "No" else "Yes"

let () =
  for _ = 1 to q do
    calc ()
  done
