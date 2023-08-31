//##// Contest ID: abc202
//##// Problem ID: abc202_c ( https://atcoder.jp/contests/abc202/tasks/abc202_c )
//##// Title: C. Made Up
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-05 04:16:15 +0000 UTC ( https://atcoder.jp/contests/abc202/submissions/23179265 ) 

open Core

let int_inf = Int.max_value
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let get_int () = Scanf.scanf "%d " (fun i -> i)
let n = get_int ()
let ai = repeat ~f:get_int [] n |> List.sort ~compare:Int.compare
let bi = repeat ~f:get_int [] n |> Array.of_list
let ci = repeat ~f:get_int [] n

let di =
  let rec aux out = function
    | [] -> out |> List.rev |> List.sort ~compare:Int.compare
    | c :: ci ->
      Printf.eprintf "c=%d\n" c;
      aux (bi.(c - 1) :: out) ci
  in
  aux [] ci
;;

let mk_tbl xs =
  let tbl = Hashtbl.create (module Int) in
  let incr = function
    | Some v -> v + 1
    | None -> 1
  in
  let add x = Hashtbl.update tbl x ~f:incr in
  List.iter xs ~f:add;
  tbl
;;

let a_tbl = mk_tbl ai
let d_tbl = mk_tbl di

module IntSet = Set.Make (Int)

let ans =
  let keys =
    List.rev_append (Hashtbl.keys a_tbl) (Hashtbl.keys d_tbl) |> IntSet.of_list
  in
  let f count k =
    count
    + Option.(
        Hashtbl.find a_tbl k
        >>= (fun a -> Hashtbl.find d_tbl k >>= fun d -> a * d |> return)
        |> value ~default:0)
  in
  keys |> IntSet.fold ~init:0 ~f |> Int.to_string
;;

let () = ans |> print_endline
