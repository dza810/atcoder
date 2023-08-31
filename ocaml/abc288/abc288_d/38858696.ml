//##// Contest ID: abc288
//##// Problem ID: abc288_d ( https://atcoder.jp/contests/abc288/tasks/abc288_d )
//##// Title: D. Range Add Query
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-13 06:04:40 +0000 UTC ( https://atcoder.jp/contests/abc288/submissions/38858696 ) 

open Core
open IterLabels

let t = 1

let () = for _ = 1 to t do
let n, k = Scanf.scanf " %d %d" Tuple2.create in
let a = Array.init n ~f:(fun i -> Scanf.scanf " %d" Fn.id) in
let q = Scanf.scanf " %d" Fn.id in

let s =
  let s = Array.create ~len:(n) 0 in
    (0 -- (n - 1)) (fun nn ->
      s.(nn) <- (if nn - k >= 0 then s.(nn - k) else 0) + a.(nn) );
  s
    in

let check l r =
  let sr = Array.init k ~f:(const 0) in
  (0 -- (k-1)) (fun i -> sr.((r-i) % k) <- if r - i >= 0 then s.(r - i) else 0);
  let sl = Array.init k ~f:(const 0) in
  (0 -- (k-1)) (fun i -> sl.((l-i) % k) <- if l - i >= 0 then s.(l - i) else 0);
  let s0 = sr.(0) - sl.(0) in
  1 -- (k - 1) |> for_all ~f:(fun kk -> s0 = sr.(kk) - sl.(kk))
in
let () =
  for _ = 1 to q do
    let l, r = Scanf.scanf " %d %d" Tuple2.create in
    let l, r = l - 1, r - 1 in
    let flg = check (l - 1) r in
    Printf.printf "%s\n" @@ if flg then "Yes" else "No"
  done
in ()
done