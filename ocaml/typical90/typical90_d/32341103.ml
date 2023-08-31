//##// Contest ID: typical90
//##// Problem ID: typical90_d ( https://atcoder.jp/contests/typical90/tasks/typical90_d )
//##// Title: 004. Cross Sum（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-09 15:26:31 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32341103 ) 

open Core
open Printf
open Scanf
open Num

let inf = Int.max_value
let id x = x
let ( >>| ) x f = Array.map x ~f
let hh = scanf " %d" id
let ww = scanf " %d" id
let hw = Array.init hh ~f:(fun _ -> Array.init ww ~f:(fun _ -> scanf " %d" id))

let ws =
  Array.fold
    hw
    ~init:(Array.init ww ~f:(fun _ -> 0))
    ~f:(fun acc x -> Array.zip_exn acc x >>| fun (x, y) -> x + y)
;;

let hs =
  Array.map hw ~f:(fun x -> Array.fold x ~init:0 ~f:( + ))
;;

let () =
  let ans =
    Array.zip_exn hw hs
    >>| fun (vs, hv) -> Array.zip_exn vs ws >>| fun (v, wv) -> hv + wv - v
  in
  ans
  |> Array.iter ~f:(fun x ->
         x |> Array.iter ~f:(fun v -> printf "%d " v);
         print_endline "")
;;
