//##// Contest ID: abc286
//##// Problem ID: abc286_a ( https://atcoder.jp/contests/abc286/tasks/abc286_a )
//##// Title: A. Range Swap
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-27 12:31:23 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38356383 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let p = Scanf.scanf " %d" Fn.id
let q = Scanf.scanf " %d" Fn.id
let r = Scanf.scanf " %d" Fn.id
let s = Scanf.scanf " %d" Fn.id
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)

let () =
  (1 -- n) (fun i ->
      let print x =
        if i < n then Printf.printf "%d " a.(x - 1)
        else Printf.printf "%d\n" a.(x - 1)
      in
      let i =
        if p <= i && i <= q then i - p + r
        else if r <= i && i <= s then i + p - r
        else i
      in
      print i)
