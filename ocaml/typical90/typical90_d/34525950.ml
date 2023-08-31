//##// Contest ID: typical90
//##// Problem ID: typical90_d ( https://atcoder.jp/contests/typical90/tasks/typical90_d )
//##// Title: 004. Cross Sum（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 07:47:56 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34525950 ) 

open Core
open Printf

(* open Num *)
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d \n" x else printf "%d " x;
        acc - 1)
  in
  ()
;;

let cache tbl key ~f =
  match Stdlib.Hashtbl.find_opt tbl key with
  | Some x -> x
  | None ->
    let x = f () in
    Stdlib.Hashtbl.add tbl key x;
    x
;;

(************)
let hh, ww = si2 ()

let aa = Array.init hh ~f:(fun _ -> Array.init ww ~f:si)

let hsum = aa |> Array.map ~f:(Array.fold ~init:0 ~f:(+))
let wsum = aa |> Array.fold ~init:(Array.init ww ~f:(fun _ -> 0)) ~f:(fun acc x -> Array.zip_exn acc x |> Array.map ~f:(fun (x,y) -> x + y))

let () =
  (0 -- (hh - 1)) (fun h ->
    let w = 0 in
    printf "%d" (hsum.(h) + wsum.(w) - aa.(h).(w));
    (1 -- (ww - 1)) (fun w ->
      printf " %d" (hsum.(h) + wsum.(w) - aa.(h).(w))
    );
    print_endline ""
    )