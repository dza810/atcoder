//##// Contest ID: abc287
//##// Problem ID: abc287_d ( https://atcoder.jp/contests/abc287/tasks/abc287_d )
//##// Title: D. Match or Not
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-12 12:26:07 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38843940 ) 

open Core
open IterLabels

let char_eq x y = Char.(x = '?' || y = '?' || x = y)
let s = Scanf.scanf " %s" String.to_array
let t = Scanf.scanf " %s" String.to_array
let len_t = Array.length t
let pre = Array.init (len_t + 1) ~f:(const false)

let () =
  pre.(0) <- true;
  (1 -- len_t) (fun i -> pre.(i) <- pre.(i - 1) && char_eq s.(i - 1) t.(i - 1))

let sub = Array.init (len_t + 1) ~f:(const false)

let () =
  let s = Array.of_list_rev @@ Array.to_list s in
  let t = Array.of_list_rev @@ Array.to_list t in
  sub.(0) <- true;
  (1 -- len_t) (fun i -> sub.(i) <- sub.(i - 1) && char_eq s.(i - 1) t.(i - 1))

let p f = print_endline @@ if f then "Yes" else "No"
let () = (0 -- len_t) (fun x -> p @@ (pre.(x) && sub.(len_t - x)))
