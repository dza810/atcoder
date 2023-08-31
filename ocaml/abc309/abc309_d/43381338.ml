//##// Contest ID: abc309
//##// Problem ID: abc309_d ( https://atcoder.jp/contests/abc309/tasks/abc309_d )
//##// Title: D. Add One Edge
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-08 13:17:28 +0000 UTC ( https://atcoder.jp/contests/abc309/submissions/43381338 ) 

open IterLabels
open Core

let n1, n2, m = Scanf.scanf " %d %d %d" Tuple3.create
let graph = Hashtbl.create (module Int)

let () =
  (1 -- m) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u, v = (u - 1, v - 1) in
      Hashtbl.add_multi graph ~key:u ~data:v;
      Hashtbl.add_multi graph ~key:v ~data:u)

let dijistra st =
  let dist = Array.init (n1 + n2) ~f:(Fn.const (1 lsl 59)) in
  let q = Map.empty (module Int) in
  dist.(st) <- 0;
  let q = Map.add_multi q ~key:0 ~data:st in
  let rec loop q =
    match Map.min_elt q with
    | None | Some (_, []) -> dist
    | Some (k, p :: _) ->
        let q = Map.remove_multi q k in
        Hashtbl.find_multi graph p |> of_list
        |> fold ~init:q ~f:(fun q pp ->
               let d = 1 in
               if dist.(pp) > dist.(p) + d then (
                 dist.(pp) <- dist.(p) + d;
                 Map.add_multi q ~key:dist.(pp) ~data:pp)
               else q)
        |> loop
  in
  loop q

let d1 =
  dijistra 0 |> Array.sub ~pos:0 ~len:n1 |> of_array |> Iter.max_exn ?lt:None

let d2 =
  dijistra (n1 + n2 - 1)
  |> Array.sub ~pos:n1 ~len:n2 |> of_array |> Iter.max_exn ?lt:None

let () = Printf.printf "%d\n" @@ (d1 + d2 + 1)
