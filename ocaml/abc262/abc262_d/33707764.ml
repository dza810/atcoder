//##// Contest ID: abc262
//##// Problem ID: abc262_d ( https://atcoder.jp/contests/abc262/tasks/abc262_d )
//##// Title: D. I Hate Non-integer Number
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-08-01 08:26:56 +0000 UTC ( https://atcoder.jp/contests/abc262/submissions/33707764 ) 

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
let m x = x % 998244353
let nn = si ()

let aa =
  Array.init nn ~f:(fun _ ->
      let a = si () in
      a)
;;

let calc i =
  let dp_tbl =
    Array.init (nn + 1) ~f:(fun _ ->
        Array.init (i + 1) ~f:(fun _ -> Array.init i ~f:(fun _ -> 0)))
  in
  dp_tbl.(0).(0).(0) <- 1;
  (0 -- (nn - 1)) (fun j ->
      (0 -- i) (fun k ->
          (0 -- (i - 1)) (fun l ->
              dp_tbl.(j + 1).(k).(l) <- m @@ dp_tbl.(j + 1).(k).(l) + dp_tbl.(j).(k).(l);
              if k <> i
              then
                dp_tbl.(j + 1).(k + 1).((l + aa.(j)) % i)
                  <- m @@ dp_tbl.(j + 1).(k + 1).((l + aa.(j)) % i) + dp_tbl.(j).(k).(l))));
  dp_tbl.(nn).(i).(0)
;;

let () =
  1 -- nn
  |> map ~f:(fun i -> m @@ calc i)
  |> fold ~init:0 ~f:(fun acc x -> m @@ (m x + acc))
  |> pi
;;
