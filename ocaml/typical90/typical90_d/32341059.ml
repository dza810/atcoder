//##// Contest ID: typical90
//##// Problem ID: typical90_d ( https://atcoder.jp/contests/typical90/tasks/typical90_d )
//##// Title: 004. Cross Sum（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-09 15:23:10 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32341059 ) 

open Core
open Printf
open Scanf
open Num

let inf = Int.max_value
let id x = x
let hh = scanf " %d" id
let ww = scanf " %d" id
let hw = List.init hh ~f:(fun _ -> List.init ww ~f:(fun _ -> scanf " %d" id) |> List.rev) |> List.rev

let ws =
  let open List in
  List.fold
    hw
    ~init:(List.init ww ~f:(fun _ -> 0))
    ~f:(fun acc x -> List.zip_exn acc x >>| fun (x, y) -> x + y)
;;

let hs =
  let open List in
  List.map hw ~f:(fun x -> List.fold x ~init:0 ~f:( + ))
;;

let () =
  let open List in
  let ans =
    List.zip_exn hw hs
    >>| fun (vs, hv) ->
    List.zip_exn vs ws >>| fun (v, wv) -> hv + wv - v
  in
  ans |> List.iter ~f:(fun x -> x |> List.iter ~f:(fun v -> printf "%d " v); print_endline "") 
;;
