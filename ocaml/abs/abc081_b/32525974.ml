//##// Contest ID: abs
//##// Problem ID: abc081_b ( https://atcoder.jp/contests/abs/tasks/abc081_b )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 02:28:09 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32525974 ) 

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

let nn = si ()
let aa = (0 -- nn) >>| si
let count x =
  let rec aux c x =
    if x <= 0 then 0 else
    if x mod 2 = 0 then aux (c + 1) (x / 2)
    else c
  in
  aux 0 x
;;
let () =
  aa >>| count |> fold Int.max_value Int.min |> pi