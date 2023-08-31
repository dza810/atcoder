//##// Contest ID: abc284
//##// Problem ID: abc284_a ( https://atcoder.jp/contests/abc284/tasks/abc284_a )
//##// Title: A. Sequence of Strings
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-07 12:13:40 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/37809946 ) 

open Core
open Printf
let id x = x
let si _ = Scanf.scanf " %d" id
let ss _ = Scanf.scanf " %s" id
let ps d = printf "%s\n" d

(************)

let nn = si ()

let rec loop n =
  if n = 0 then () else
    (
  let x = ss () in
  loop (n-1);
  ps x
    )

let () = loop nn
