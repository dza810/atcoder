//##// Contest ID: abc267
//##// Problem ID: abc267_c ( https://atcoder.jp/contests/abc267/tasks/abc267_c )
//##// Title: C. Index × A(Continuous ver.)
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-06 07:29:46 +0000 UTC ( https://atcoder.jp/contests/abc267/submissions/34651078 ) 

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
let mm = si ()
let aa = Array.create ~len:(nn + 1) 0
let () = 1 -- nn |> iter ~f:(fun i -> aa.(i) <- si ())
let bb = Array.create ~len:(nn + 1) 0
let () = 1 -- nn |> iter ~f:(fun i -> bb.(i) <- bb.(i - 1) + aa.(i))
let cc = Array.create ~len:(nn + 1) 0
let () = 1 -- nn |> iter ~f:(fun i -> cc.(i) <- cc.(i - 1) + (i * aa.(i)))

let dd =
  0 -- (nn - mm)
  |> map ~f:(fun l ->
         cc.(l + mm) - cc.(l) - (l * (bb.(l + mm) - bb.(l))))
;;

let () =
  dd |> max_exn ?lt:None |> pi