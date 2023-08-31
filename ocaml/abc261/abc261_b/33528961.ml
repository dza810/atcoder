//##// Contest ID: abc261
//##// Problem ID: abc261_b ( https://atcoder.jp/contests/abc261/tasks/abc261_b )
//##// Title: B. Tournament Result
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-26 06:32:53 +0000 UTC ( https://atcoder.jp/contests/abc261/submissions/33528961 ) 

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

(************)
let nn = si ()
let aa = Array.init nn ~f:(fun _ -> Array.init nn ~f:sc)

let () =
  let ans =
    0 -- (nn - 1)
    |> for_all ~f:(fun a ->
           ((a + 1) -- (nn - 1))
           |> for_all ~f:(fun b ->
                  Char.(aa.(a).(b) = 'W' && aa.(b).(a) = 'L')
                  || Char.(aa.(a).(b) = 'L' && aa.(b).(a) = 'W')
                  || Char.(aa.(a).(b) = 'D' && aa.(b).(a) = 'D')))
  in
  ps @@ if ans then "correct" else "incorrect"
;;
