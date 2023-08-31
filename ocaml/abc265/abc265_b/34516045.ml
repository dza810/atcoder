//##// Contest ID: abc265
//##// Problem ID: abc265_b ( https://atcoder.jp/contests/abc265/tasks/abc265_b )
//##// Title: B. Explore
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 15:45:02 +0000 UTC ( https://atcoder.jp/contests/abc265/submissions/34516045 ) 

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
let aa = Array.init nn ~f:(fun i -> if i = 0 then 0 else si ())
let xy = Hashtbl.create (module Int)

let () =
  (1 -- mm) (fun _ ->
      let x, y = si2 () in
      Hashtbl.add_exn xy ~key:x ~data:y)
;;

let () =
  let i = ref 0 in
  let tt = ref tt in
  while !tt > 0 && !i < nn do
    tt := !tt - aa.(!i) + Option.value ~default:0 (Hashtbl.find xy !i);
    incr i
  done;
  ps @@ if !i = nn && !tt > 0 then "Yes" else "No"
;;
