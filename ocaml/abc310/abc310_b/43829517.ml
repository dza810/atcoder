//##// Contest ID: abc310
//##// Problem ID: abc310_b ( https://atcoder.jp/contests/abc310/tasks/abc310_b )
//##// Title: B. Strictly Superior
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-22 12:02:58 +0000 UTC ( https://atcoder.jp/contests/abc310/submissions/43829517 ) 

open IterLabels
open Core

let n, m = Scanf.scanf " %d %d" Tuple2.create

let pcf =
  1 -- n
  |> map ~f:(fun _ ->
         let p, c = Scanf.scanf " %d %d" Tuple2.create in
         let f =
           Array.init c ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
           |> Set.of_array (module Int)
         in
         (p, c, f))
  |> to_array

let () =
  match
    1 -- n
    |> find (fun i ->
           i + 1 -- n
           |> find (fun j ->
                  let i, j =
                    if fst3 pcf.(i - 1) < fst3 pcf.(j - 1) then (j, i)
                    else (i, j)
                  in
                  let pi, ci, fi = pcf.(i - 1) in
                  let pj, cj, fj = pcf.(j - 1) in
                  if Set.is_subset ~of_:fj fi then
                    if pi > pj || Set.length (Set.diff fj fi) > 0 then
                      Some (i, j)
                    else None
                  else None))
  with
  | Some _ -> print_endline "Yes"
  | None -> print_endline "No"
