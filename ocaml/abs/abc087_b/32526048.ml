//##// Contest ID: abs
//##// Problem ID: abc087_b ( https://atcoder.jp/contests/abs/tasks/abc087_b )
//##// Title: 
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 02:35:42 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/32526048 ) 

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
let fold f init x = List.fold ~f ~init x

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

(************)

let aa = si ()
let bb = si ()
let cc = si ()
let xx = si ()

let () =
  let l =
    0 -- (aa + 1)
    >>| fun a ->
    0 -- (bb + 1)
    >>| fun b ->
    let x = (500 * a) + (100 * b) in
    let x = (xx - x) / 50 in
    if 0 <= x && x <= cc then 1 else 0
  in
  l |> fold (fold ( + )) 0 |> pi
;;
