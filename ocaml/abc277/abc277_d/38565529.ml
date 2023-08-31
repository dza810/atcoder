//##// Contest ID: abc277
//##// Problem ID: abc277_d ( https://atcoder.jp/contests/abc277/tasks/abc277_d )
//##// Title: D. Takahashi's Solitaire
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-03 06:31:46 +0000 UTC ( https://atcoder.jp/contests/abc277/submissions/38565529 ) 

open IterLabels
open Core
module ISet = Set.Make (Int)

let n, m = Scanf.scanf " %d %d" Tuple2.create
let a = 
  match 1 -- n |> map ~f:(fun _ -> Scanf.scanf " %d" Fn.id) |> count |> to_list |> Hashtbl.of_alist (module Int) with
  | `Ok a -> a
  | _ -> failwith ""

let cnt_sum = a |> Hashtbl.fold ~init:0 ~f:(fun ~key ~data acc -> acc + key * data)

let memo = Caml.Hashtbl.create 1_000_000
let rec calc v =
  match Caml.Hashtbl.find_opt memo v with
  | Some vv -> vv
  | None ->(
    Caml.Hashtbl.add memo v 0;
    let vv =
      match Hashtbl.find a v with
      | Some c -> v * c + calc ((v + 1)  % m)
      | None -> 0
    in
    Caml.Hashtbl.add memo v vv;
    vv)

let () = 
let v = Hashtbl.fold a ~init:0 ~f:(fun ~key ~data:_ acc -> Int.max acc @@ calc key) in
let v = cnt_sum - v in
Printf.printf "%d\n" v 

