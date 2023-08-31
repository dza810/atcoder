//##// Contest ID: abc265
//##// Problem ID: abc265_b ( https://atcoder.jp/contests/abc265/tasks/abc265_b )
//##// Title: B. Explore
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 06:43:48 +0000 UTC ( https://atcoder.jp/contests/abc265/submissions/34506563 ) 

open Core
open Printf
open Num
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

(************)
let nn, mm, tt = si3 ()
let aa = Array.init (nn - 1) ~f:si
let xy = Hashtbl.create (module Int)

let () =
  (1 -- mm) (fun _ ->
      let x, y = si2 () in
      Hashtbl.add_exn xy ~key:x ~data:y)
;;

let tt = tt |> num_of_int

let rec step t i =
  let y = Hashtbl.find xy i |> Option.value ~default:0 in
  if Num.(t <=/ num_of_int 0)
  then false
  else if i = nn
  then true
  else (
    let t = t +/ num_of_int y in
    let t = t -/ num_of_int aa.(i - 1) in
    step t (i + 1))
;;

let () = ps @@ if step tt 1 then "Yes" else "No"
