//##// Contest ID: abc255
//##// Problem ID: abc255_a ( https://atcoder.jp/contests/abc255/tasks/abc255_a )
//##// Title: A. You should output ARC, though this is ABC.
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-17 07:25:27 +0000 UTC ( https://atcoder.jp/contests/abc255/submissions/32515006 ) 

open Core
open Num
  
let id x = x
let inf = Int.max_value
let si _ = Scanf.scanf " %d" id
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let pf f = printf "%0.8f\n" f
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

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let i2f = Float.of_int


(* ここから *)
let rr = si ()
let cc = si ()

let aa = Array.init 2 ~f:(fun _ -> Array.init 2 ~f:si)

let () = aa.(rr - 1).(cc - 1) |> pi