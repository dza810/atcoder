//##// Contest ID: abc307
//##// Problem ID: abc307_b ( https://atcoder.jp/contests/abc307/tasks/abc307_b )
//##// Title: B. racecar
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-24 12:32:40 +0000 UTC ( https://atcoder.jp/contests/abc307/submissions/42910145 ) 

open IterLabels
open Core

let n = Scanf.scanf " %d" Fn.id
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %s" Fn.id)

let is_palindrome si sj =
  (* 100 *)
  let s = si ^ sj in
  let s_rev = String.rev s |> String.to_array in
  let s = String.to_array s in
  Array.zip_exn s s_rev |> Array.for_all ~f:(fun (ss, ssr) -> Char.(ss = ssr))

let flg =
  (* 100 *)
  0 -- (n - 1)
  |> exists ~f:(fun i ->
    (* 100 *)
         0 -- (n - 1)
         |> exists ~f:(fun j -> i <> j && is_palindrome a.(i) a.(j)))

let () = print_endline @@ if flg then "Yes" else "No"
