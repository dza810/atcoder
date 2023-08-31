//##// Contest ID: abc314
//##// Problem ID: abc314_c ( https://atcoder.jp/contests/abc314/tasks/abc314_c )
//##// Title: C. Rotate Colored Subsequence
//##// Language: OCaml (ocamlopt 5.0.0)
//##// Submitted: 2023-08-17 08:35:43 +0000 UTC ( https://atcoder.jp/contests/abc314/submissions/44661103 ) 

open IterLabels
open Core

let n, m = Scanf.scanf " %d %d" Tuple2.create
let s = Scanf.scanf " %s" Fn.id
let color = Hashtbl.create (module Int)
let shft = Array.init ~f:Fn.id n

let () =
  1 -- n
  |> iter ~f:(fun i ->
         let i = i - 1 in
         let cc = Scanf.scanf " %d" Fn.id in
         Hashtbl.add_multi color ~key:cc ~data:i)

let () =
  Hashtbl.iteri color ~f:(fun ~key ~data ->
      let data = List.sort data ~compare:Int.compare in
      let sm = List.last_exn data in
      let lg = List.hd_exn data in
      shft.(lg) <- sm;
      let rec f data =
        match data with
        | r :: l :: xs ->
            shft.(l) <- r;
            f (l :: xs)
        | _ -> ()
      in
      f data)

let s = String.to_array s

let () =
  (0 -- (n - 1)) (fun i ->
      let j = shft.(i) in
      printf "%c" s.(j));
  print_endline ""
