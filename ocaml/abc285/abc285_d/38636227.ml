//##// Contest ID: abc285
//##// Problem ID: abc285_d ( https://atcoder.jp/contests/abc285/tasks/abc285_d )
//##// Title: D. Change Usernames
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-05 03:41:40 +0000 UTC ( https://atcoder.jp/contests/abc285/submissions/38636227 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let _par = Hashtbl.create (module String)

let rec par x =
  match Hashtbl.find _par x with
  | None -> x
  | Some v when String.(x = v) -> x
  | Some v ->
    let v = par v in
    Hashtbl.set _par ~key:x ~data:v;
    v
;;

let union (s, t) =
  let s = par s in
  let t = par t in
  if String.(s = t)
  then false
  else (
    Hashtbl.set _par ~key:s ~data:t;
    true)
;;

let st = Array.init n ~f:(fun _ -> Scanf.scanf " %s %s" Tuple2.create)
let flg = Array.for_all st ~f:union
let () = print_endline @@ if flg then "Yes" else "No"
