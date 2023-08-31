//##// Contest ID: abc286
//##// Problem ID: abc286_e ( https://atcoder.jp/contests/abc286/tasks/abc286_e )
//##// Title: E. Souvenir
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-12 13:07:21 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38845518 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)

let graph =
  Array.init n ~f:(fun i ->
      Array.init n ~f:(fun j ->
          match Scanf.scanf " %c" Fn.id with
          | 'Y' -> true
          | 'N' -> false
          | _ -> failwith "never"))

let ( ++ ) (a, b) (x, y) = (a + x, b + y)

let dist =
  Array.init n ~f:(fun i ->
      Array.init n ~f:(fun j ->
          if i = j then (0, 0)
          else if graph.(i).(j) then (1, -a.(j))
          else (Int.max_value_30_bits, 0)))

let () =
  for k = 0 to n - 1 do
    for i = 0 to n - 1 do
      for j = 0 to n - 1 do
        dist.(i).(j) <- Poly.min dist.(i).(j) @@ (dist.(i).(k) ++ dist.(k).(j))
      done
    done
  done

let q = Scanf.scanf " %d" Fn.id

let () =
  (1 -- q) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u,v = u - 1, v - 1 in
      let c, aa = dist.(u).(v) in
      if c = Int.max_value_30_bits then print_endline "Impossible"
      else printf "%d %d\n" c (a.(u) - aa))
