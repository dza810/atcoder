//##// Contest ID: typical90
//##// Problem ID: typical90_ab ( https://atcoder.jp/contests/typical90/tasks/typical90_ab )
//##// Title: 028. Cluttered Paper（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-04 15:35:32 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32988076 ) 

open Core
open Printf

(* open Num *)
(* open IterLabels *)

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let si4 _ = Scanf.scanf " %d %d %d %d" (fun x y z a-> x, y, z, a)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)
let ( >|| ) x f = iter ~f x
let sort_int = sort ~compare:Int.compare

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let option_either l ~f =
  List.fold l ~init:None ~f:(fun acc x ->
      match acc with
      | None -> f x
      | Some x -> Some x)
;;

(************)
let nn = si ()

let tbl = Array.make_matrix ~dimx:1002 ~dimy:1002 0

(* 
    
ry (lx, ry)...(rx,ry)
...
ly (lx, ly)...(rx,ly)
    lx         rx
*)
;;

let () =
  1 -- nn >|| fun _ ->(
    let lx, ly, rx, ry = si4 () in
    tbl.(lx).(ly) <- tbl.(lx).(ly) + 1;
    tbl.(rx).(ly) <- tbl.(rx).(ly) - 1;
    tbl.(lx).(ry) <- tbl.(lx).(ry) - 1;
    tbl.(rx).(ry) <- tbl.(rx).(ry) + 1
  )
;;
let () =
  for x = 1 to 1001 do
    for y = 0 to 1001 do
      tbl.(x).(y) <- tbl.(x - 1).(y) + tbl.(x).(y)
    done
  done
;;

let () =
  for x = 0 to 1001 do
    for y = 1 to 1001 do
      tbl.(x).(y) <- tbl.(x).(y - 1) + tbl.(x).(y)
    done
  done
;;
let ans = Array.init (nn + 1) ~f:(fun _ -> 0)

let () =
  tbl |> Array.iter ~f:(fun x -> x |> Array.iter ~f:(fun x -> ans.(x) <- ans.(x) + 1)); 
  ans |> Array.iteri ~f:(fun i x -> if i <> 0 then pi x)
