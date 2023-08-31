//##// Contest ID: abc284
//##// Problem ID: abc284_c ( https://atcoder.jp/contests/abc284/tasks/abc284_c )
//##// Title: C. Count Connected Components
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-07 13:32:48 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/37844949 ) 

open IterLabels

open Core
open Printf
open Scanf

let id x = x
let si _ = scanf " %d" id
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let pi x = printf "%d\n" x

(************)
let nn = si ()
let mm = si ()
let par = Array.init (nn + 1) ~f:id

let rec root p =
  if par.(p) = p then p
  else (
    par.(p) <- root par.(p);
    par.(p))

let unite u v =
  let u = root u in
  let v = root v in
  if u = v then () else par.(u) <- v

let () =
  for _ = 1 to mm do
    let u, v = si2 () in
    unite u v
  done

let () =
  let () = (1 -- nn) (fun x -> ignore @@ root x) in
  let s = par |> Set.of_array (module Int) in
  pi (Set.length s - 1)
