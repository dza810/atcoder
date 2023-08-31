//##// Contest ID: abc271
//##// Problem ID: abc271_c ( https://atcoder.jp/contests/abc271/tasks/abc271_c )
//##// Title: C. Manga
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-08 06:25:19 +0000 UTC ( https://atcoder.jp/contests/abc271/submissions/38709329 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let tmp = 1 -- n |> map ~f:(fun _ -> Scanf.scanf " %d" Fn.id) |> count |> persistent
let a = tmp |> map ~f:fst |> to_array
let () = Array.sort ~compare:Int.compare a
let sell = tmp |> map ~f:(fun (v, c) -> c - 1) |> sum

let rec loop read i r s =
  assert (s >= 0);
  if i <= r && a.(i - 1) = read + 1
  then (
    (* read *)
    loop (read + 1) (i + 1) r s)
  else (
    match s with
    | 0 when r - i + 1 >= 2 -> loop (read + 1) i (r - 2) 0
    | 1 when r - i + 1 >= 1 -> loop (read + 1) i (r - 1) 0
    | s when s >= 2 -> loop (read + 1) i r (s - 2)
    | _ ->
      read)
;;

let () = Printf.printf "%d\n" @@ loop 0 1 (Array.length a) sell
