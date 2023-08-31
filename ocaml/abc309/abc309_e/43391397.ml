//##// Contest ID: abc309
//##// Problem ID: abc309_e ( https://atcoder.jp/contests/abc309/tasks/abc309_e )
//##// Title: E. Family and Insurance
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-08 13:48:50 +0000 UTC ( https://atcoder.jp/contests/abc309/submissions/43391397 ) 

open IterLabels
open Core

let n, m = Scanf.scanf " %d %d" Tuple2.create

let pp =
  Array.init n ~f:(fun i -> if i = 0 then 0 else Scanf.scanf " %d" Int.pred)

let xy = Hashtbl.create (module Int)

let () =
  (1 -- m) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u, v = (u - 1, v) in
      Hashtbl.update xy u ~f:(function None -> v | Some vv -> Int.max v vv))

let dp =
  Array.init n ~f:(fun i -> Hashtbl.find xy i |> Option.value ~default:(-1))

let () = (0 -- (n - 1)) (fun i -> dp.(i) <- Int.max dp.(i) (dp.(pp.(i)) - 1))
let () = dp |> Array.count ~f:(fun x -> x >= 0) |> Printf.printf "%d\n"
