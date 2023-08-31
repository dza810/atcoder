//##// Contest ID: typical90
//##// Problem ID: typical90_g ( https://atcoder.jp/contests/typical90/tasks/typical90_g )
//##// Title: 007. CP Classes（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-12 14:33:46 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32442237 ) 

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

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let nn = si ()
let aa = 0 -- nn >>| si |> List.sort ~compare:Int.compare |> Array.of_list
let qq = si ()
let bb = 0 -- qq >>| si

let rec bin_search f e l r =
  if e l r
  then l, r
  else (
    let c = ((r - l) / 2) + l in
    if f c then bin_search f e l c else bin_search f e c r)
;;

let () =
  bb
  >|| fun b ->
  let aa = aa in
  let l, r = bin_search (fun x -> aa.(x) > b) (fun l r -> r - l <= 1) 0 (nn-1) in
  min (Int.abs @@ (aa.(l) - b)) (Int.abs @@ (aa.(r) - b)) |> pi
;;
