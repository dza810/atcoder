//##// Contest ID: typical90
//##// Problem ID: typical90_bc ( https://atcoder.jp/contests/typical90/tasks/typical90_bc )
//##// Title: 055. Select 5（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-18 06:57:29 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/33337533 ) 

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
let nn, pp, qq = si3 ()
let aa = Array.init nn ~f:(fun _ -> si () % pp)

let () =
  let cnt = ref 0 in
  for i1 = 0 to nn - 1 do
    let v = aa.(i1)in
    for i2 = i1 + 1 to nn - 1 do
      let v = v * aa.(i2) % pp in
      for i3 = i2 + 1 to nn - 1 do
        let v = v * aa.(i3) % pp in
        for i4 = i3 + 1 to nn - 1 do
          let v = v * aa.(i4) % pp in
          for i5 = i4 + 1 to nn - 1 do
            let v = v * aa.(i5) % pp in
            if v = qq then incr cnt
          done
        done
      done
    done
  done;
  pi !cnt
;;
