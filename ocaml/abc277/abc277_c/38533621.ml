//##// Contest ID: abc277
//##// Problem ID: abc277_c ( https://atcoder.jp/contests/abc277/tasks/abc277_c )
//##// Title: C. Ladder Takahashi
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-01 17:20:15 +0000 UTC ( https://atcoder.jp/contests/abc277/submissions/38533621 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let ab = Array.init n ~f:(fun _ -> Scanf.scanf " %d %d" Tuple2.create)

(* let vs =
  let tbl = Hashtbl.create (module Int) in
  let vs =
    ab
    |> Array.fold ~init:[] ~f:(fun acc (a, b) -> a :: b :: acc)
    |> List.sort ~compare:Int.compare
    |> List.iteri ~f:(fun i v -> Hashtbl.add_exn tbl ~key:v ~data:i)
  in
  tbl
;;

let ab =
  let find c = Hashtbl.find_exn vs c in
  Array.map ~f:(fun (a, b) -> find a, find b)
;; *)

let _par = Hashtbl.create (module Int)

let rec par x =
  match Hashtbl.find _par x with
  | None -> x
  | Some v when v = x -> x
  | Some v ->
    let p = par v in
    let () = Hashtbl.set _par ~key:x ~data:p in
    p
;;

let union x y =
  let x = par x in
  let y = par y in
  let x, y = Int.min x y, Int.max x y in
  Hashtbl.set _par ~key:x ~data:y
;;

let () = Array.iter ab ~f:(fun (a, b) -> union a b)
let () = Hashtbl.keys _par |> List.iter ~f:(fun k -> ignore @@ par k)

let () =
  Printf.printf "%d\n"
  @@
  match Hashtbl.find _par 1 with
  | None -> 1
  | Some v -> v
;;
