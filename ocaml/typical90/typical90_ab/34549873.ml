//##// Contest ID: typical90
//##// Problem ID: typical90_ab ( https://atcoder.jp/contests/typical90/tasks/typical90_ab )
//##// Title: 028. Cluttered Paper（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-03 12:29:21 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34549873 ) 

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

let i2f x = Int.to_float x

(************)
let nn = si ()
let tbl = Array.make_matrix ~dimx:1010 ~dimy:1010 0

let () =
  (1 -- nn) (fun _ ->
      let lx, ly = si2 () in
      let rx, ry = si2 () in
      tbl.(lx).(ly) <- tbl.(lx).(ly) + 1;
      tbl.(rx).(ry) <- tbl.(rx).(ry) + 1;
      tbl.(lx).(ry) <- tbl.(lx).(ry) - 1;
      tbl.(rx).(ly) <- tbl.(rx).(ly) - 1)
;;

let () =
  let tbl =
    tbl
    |> Array.map ~f:(fun x ->
           x |> Array.folding_map ~init:0 ~f:(fun acc x -> acc + x, acc + x))
  in
  let tbl =
    tbl
    |> Array.folding_map ~init:(Array.create ~len:1010 0) ~f:(fun acc x ->
           let v = Array.zip_exn acc x |> Array.map ~f:(fun (a, b) -> a + b) in
           v, v)
  in
  let count = Array.create ~len:(nn + 10) 0 in
  tbl
  |> Array.iter ~f:(fun l ->
         l
         |> Array.iter ~f:(fun v ->
                try count.(v) <- count.(v) + 1 with
                | _ ->
                  pi v;
                  exit 1));
  (1 -- nn) (fun k -> pi @@ count.(k))
;;
