//##// Contest ID: typical90
//##// Problem ID: typical90_ah ( https://atcoder.jp/contests/typical90/tasks/typical90_ah )
//##// Title: 034. There are few types of elements（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-08-21 04:41:01 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/44812171 ) 

open IterLabels
open Core

let n, k = Scanf.scanf " %d %d" Tuple2.create
let an = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let st = Hashtbl.create (module Int)
let cnt = ref 0

let rec f ans l r =
  let ans = if !cnt <= k then Int.max ans (r - l) else ans in
  if r = n then ans
  else
    let l, r =
      if !cnt <= k then (
        Hashtbl.change st an.(r) ~f:(function
          | None ->
              Int.incr cnt;
              Some 1
          | Some i -> Some (i + 1));
        (l, r + 1))
      else (
        Hashtbl.change st an.(l) ~f:(function
          | None -> failwith ""
          | Some 1 ->
              Int.decr cnt;
              None
          | Some i -> Some (i - 1));
        (l + 1, r))
    in
    f ans l r

let () = Printf.printf "%d\n" @@ f 0 0 0
