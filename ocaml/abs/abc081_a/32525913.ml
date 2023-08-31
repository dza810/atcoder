//##// Contest ID: abs
//##// Problem ID: abc081_a ( https://atcoder.jp/contests/abs/tasks/abc081_a )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 02:22:25 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32525913 ) 

open Core
open Num

let id x = x
let inf = Int.max_value
let si _ = Scanf.scanf " %d" id
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f
let ( -- ) s e = List.init (e - s) ~f:(( + ) s)
let ( >>| ) x f = List.map ~f x
let ( >|| ) x f = List.iter ~f x
let ( >>= ) x f = List.bind ~f x
let fold init f x = List.fold ~f ~init x

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

(************)
let si d = Scanf.scanf "%1d" id

let a, b, c= si (), si (), si()
let () = a + b + c |> pi