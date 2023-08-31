//##// Contest ID: abc273
//##// Problem ID: abc273_d ( https://atcoder.jp/contests/abc273/tasks/abc273_d )
//##// Title: D. LRUD Instructions
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-07 14:06:44 +0000 UTC ( https://atcoder.jp/contests/abc273/submissions/38697197 ) 

open Core
open IterLabels

let h, w = Scanf.scanf " %d %d" Tuple2.create
let pos = Scanf.scanf " %d %d" Tuple2.create
let n = Scanf.scanf " %d" Fn.id
let rs = Hashtbl.create (module Int)
let cs = Hashtbl.create (module Int)

let () =
  (1 -- n) (fun i ->
    let r, c = Scanf.scanf " %d %d" Tuple2.create in
    Hashtbl.add_multi rs ~key:r ~data:c;
    Hashtbl.add_multi cs ~key:c ~data:r)
;;

let rs = Hashtbl.map ~f:(fun l -> Array.of_list @@ List.sort ~compare:Int.compare l) rs
let cs = Hashtbl.map ~f:(fun l -> Array.of_list @@ List.sort ~compare:Int.compare l) cs
let q = Scanf.scanf " %d" Fn.id

let ( let* ) x f = Option.bind ~f x

let f (r, c) (d, l) =
  match d with
  | 'L' ->
    let ww =
      let* arr = Hashtbl.find rs r in
      let* i = Array.binary_search arr ~compare:Int.compare `Last_strictly_less_than c in
      Some (Array.get arr i + 1)
    in
    r, Int.max (Option.value ~default:1 ww) (c - l)
  | 'R' ->
    let ww =
      let* arr = Hashtbl.find rs r in
      let* i =
        Array.binary_search arr ~compare:Int.compare `First_strictly_greater_than c
      in
      Some (Array.get arr i - 1)
    in
    r, Int.min (Option.value ~default:w ww) (c + l)
  | 'U' ->
    let hh =
      let* arr = Hashtbl.find cs c in
      let* i = Array.binary_search arr ~compare:Int.compare `Last_strictly_less_than r in
      Some (Array.get arr i + 1)
    in
    Int.max (Option.value ~default:1 hh) (r - l), c
  | 'D' ->
    let hh =
      let* arr = Hashtbl.find cs c in
      let* i =
        Array.binary_search arr ~compare:Int.compare `First_strictly_greater_than r
      in
      Some (Array.get arr i - 1)
    in
    Int.min (Option.value ~default:h hh) (r + l), c
  | _ -> failwith ""
;;

let () =
  1 -- q
  |> fold ~init:pos ~f:(fun pos _ ->
       let dl = Scanf.scanf " %c %d" Tuple2.create in
       let hh, ww = f pos dl in
       Printf.printf "%d %d\n" hh ww;
       hh, ww)
  |> ignore
;;
