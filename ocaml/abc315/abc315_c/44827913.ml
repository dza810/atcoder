//##// Contest ID: abc315
//##// Problem ID: abc315_c ( https://atcoder.jp/contests/abc315/tasks/abc315_c )
//##// Title: C. Flavors
//##// Language: OCaml (ocamlopt 5.0.0)
//##// Submitted: 2023-08-21 13:52:53 +0000 UTC ( https://atcoder.jp/contests/abc315/submissions/44827913 ) 

open IterLabels
open Core

let n = Scanf.scanf " %d" Fn.id
let fs = Array.init n ~f:(fun _ -> Scanf.scanf " %d %d" Tuple2.create)

let () =
  Array.sort
    ~compare:(fun (f1, s1) (f2, s2) ->
      match Int.compare s2 s1 with 0 -> Int.compare f2 f1 | x -> x)
    fs

let cup1 = fs.(0)

let t =
  1 -- (n - 1)
  |> fold ~init:0 ~f:(fun acc i ->
         let t = if fst fs.(i) = fst cup1 then snd fs.(i) / 2 else snd fs.(i) in
         Int.max t acc)

let () = Printf.printf "%d\n" @@ (snd cup1 + t)
