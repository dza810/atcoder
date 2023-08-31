//##// Contest ID: abs
//##// Problem ID: practice_1 ( https://atcoder.jp/contests/abs/tasks/practice_1 )
//##// Title: PracticeA. Welcome to AtCoder
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 02:17:08 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32525852 ) 

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
let a, b, c = si (), si (), si ()
let s = ss ()
let () = printf "%d %s\n" (a + b + c) s
