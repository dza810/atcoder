//##// Contest ID: typical90
//##// Problem ID: typical90_c ( https://atcoder.jp/contests/typical90/tasks/typical90_c )
//##// Title: 003. Longest Circular Road（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-08 08:05:49 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32318336 ) 

open Core
open Printf
open Scanf
open Num

let inf = Int.max_value
let id x = x
let nn = scanf " %d" id
(* let () = eprintf "nn=%d\n" nn *)

let ab =
  let ab = Hashtbl.create (module Int) in
  let open Iter in
  let (_ : _) =
    List.init (nn - 1) ~f:id
    |> List.iter ~f:(fun _ ->
           scanf " %d %d" (fun a b ->
               Hashtbl.add_multi ab ~key:a ~data:b;
               Hashtbl.add_multi ab ~key:b ~data:a))
  in
  ab
;;

(* let () = ab |> [%sexp_of: (int, int list) Hashtbl.t] |> eprint_s *)

let len ab s =
  let score = Hashtbl.create (module Int) in
  let q = Queue.create () in
  let rec aux () =
    match Queue.dequeue q with
    | Some p ->
      let v = 1 + Hashtbl.find_exn score p in
      let l = Hashtbl.find_exn ab p in
      let f pp =
        let default _ =
          Queue.enqueue q pp;
          v
        in
        let (_ : _) = Hashtbl.find_or_add score pp ~default in
        ()
      in
      let () = List.iter l ~f in
      aux ()
    | None -> ()
  in
  let (_ : _) = Hashtbl.add score ~key:s ~data:0 in
  let () = Queue.enqueue q s in
  aux ();
  score
;;

let () =
  let score = len ab 1 in
  let s, _ =
    Hashtbl.fold score ~init:(0, 0) ~f:(fun ~key ~data (acck, accd) ->
        if accd <= data then key, data else acck, accd)
  in
  let score = len ab s in
  let _, ans =
    Hashtbl.fold score ~init:(s, 0) ~f:(fun ~key ~data (acck, accd) ->
        if accd <= data then key, data else acck, accd)
  in
  printf "%d\n" (ans + 1)
;;
