//##// Contest ID: abc263
//##// Problem ID: abc263_c ( https://atcoder.jp/contests/abc263/tasks/abc263_c )
//##// Title: C. Monotonically Increasing
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-18 05:41:16 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34121225 ) 

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

(************)
let nn = si ()
let mm = si ()

let rec loop i l x =
  if i = nn
  then l |> List.rev |> pl
  else (x -- mm) (fun m -> loop (i + 1) (m :: l) (m + 1))
;;

let () = loop 0 [] 1
