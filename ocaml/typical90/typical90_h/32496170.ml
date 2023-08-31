//##// Contest ID: typical90
//##// Problem ID: typical90_h ( https://atcoder.jp/contests/typical90/tasks/typical90_h )
//##// Title: 008. AtCounter（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-16 03:08:58 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32496170 ) 

open Core
open Num
  
let id x = x
let inf = Int.max_value
let si _ = Scanf.scanf " %d" id
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let ( -- ) s e = List.init (e - s) ~f:(( + ) s)
let ( >>| ) x f = List.map ~f x
let ( >|| ) x f = List.iter ~f x
let ( >>= ) x f = List.bind ~f x
let fold x init f = List.fold ~f ~init x

module Mod = struct
  let m = 1_000_000_007
  let mm x = ((x mod m) + m) mod m
  let ( +^ ) x y = mm x + mm y |> mm  
  let ( -^ ) x y = mm x - mm y |> mm  
  let ( *^ ) x y = mm x * mm y |> mm  
end

open Mod

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let atcoder = "atcoder"
  
let nn = si ()
let ss = ss ()
let dptbl = Hashtbl.create(module Tuple.Hashable_t(Int)(Int))

let rec dp l i =
if l = 0 then 1 else if i = 0 then 0 else
  Hashtbl.find_or_add dptbl (l, i) ~default:(fun () ->
    dp l (i - 1) +^ if Char.(String.get atcoder (l - 1) = String.get ss (i - 1)) then 
    dp (l - 1) (i - 1) else 0
  )

let () = dp 7 nn |> pi
;;