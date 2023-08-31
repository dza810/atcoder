//##// Contest ID: abc269
//##// Problem ID: abc269_e ( https://atcoder.jp/contests/abc269/tasks/abc269_e )
//##// Title: E. Last Rook
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-09 11:04:43 +0000 UTC ( https://atcoder.jp/contests/abc269/submissions/38735683 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id

let ask ~down ~up ~left ~right =
  printf "? %d %d %d %d\n%!" down up left right;
  Scanf.scanf " %d" Fn.id
;;

let rec loop ~ask i ~l ~r =
  if i = 0 || r - l = 0
  then i, (l, r)
  else (
    let cx = (r + l) / 2 in
    let k = ask l cx in
    let l, r = if k < cx - l + 1 then l, cx else cx + 1, r in
    loop ~ask (i - 1) ~l ~r)
;;

let i = 20 in
let i, (left, right) =
  loop ~ask:(fun left right -> ask ~down:1 ~up:n ~left ~right) i ~l:1 ~r:n
in
let i, (down, up) =
  loop ~ask:(fun down up -> ask ~down ~up ~left:1 ~right:n) i ~l:1 ~r:n
in
assert (i >= 0);
assert (down = up && left = right);
printf "! %d %d\n%!" down left
