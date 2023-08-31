//##// Contest ID: agc027
//##// Problem ID: agc027_a ( https://atcoder.jp/contests/agc027/tasks/agc027_a )
//##// Title: A. Candy Distribution Again
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 14:22:05 +0000 UTC ( https://atcoder.jp/contests/agc027/submissions/4378079 ) 

open Batteries

let calc x li =
  let rec aux c sum = function
    | [] when sum = x -> c
    | [] -> c - 1
    | a :: al when a + sum > x -> c
    | a :: al -> aux (1 + c) (a + sum) al
  in
  aux 0 0 li

let () =
  Scanf.scanf " %d %d " (fun n x ->
      List.init n (fun _ -> Scanf.scanf " %d" (fun x -> x))
      |> List.sort (fun x y -> x - y)
      |> calc x |> Printf.printf "%d\n" )
