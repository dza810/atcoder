//##// Contest ID: abc302
//##// Problem ID: abc302_d ( https://atcoder.jp/contests/abc302/tasks/abc302_d )
//##// Title: D. Impartial Gift
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-10 06:33:26 +0000 UTC ( https://atcoder.jp/contests/abc302/submissions/42112326 ) 

open IterLabels
open Core

let n, m, d = Scanf.scanf " %d %d %d" Tuple3.create
let a = Array.init n ~f:(fun x -> Scanf.scanf " %d" Fn.id)
let () = Array.sort ~compare:Int.compare a
let b = Array.init m ~f:(fun x -> Scanf.scanf " %d" Fn.id)
let () = Array.sort ~compare:Int.compare b

let () =
  a
  |> Array.fold ~init:(-1) ~f:(fun acc aa ->
         let f mode key acc =
           match Array.binary_search b ~compare:Int.compare mode key with
           | Some i when Int.abs (aa - b.(i)) <= d->
               Int.max acc @@ (b.(i) + aa)
           | _ -> acc
         in
         let acc = f `First_greater_than_or_equal_to (aa - d) acc in
         let acc = f `Last_less_than_or_equal_to (aa + d) acc in
         acc)
  |> printf "%d\n"
