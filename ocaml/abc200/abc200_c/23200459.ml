//##// Contest ID: abc200
//##// Problem ID: abc200_c ( https://atcoder.jp/contests/abc200/tasks/abc200_c )
//##// Title: C. Ringo's Favorite Numbers 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-06 04:41:00 +0000 UTC ( https://atcoder.jp/contests/abc200/submissions/23200459 ) 

open Core
open Num

let int_inf = Int.max_value
let id x = x
let num_zero = num_of_int 0
let num_one = num_of_int 1

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let get_int () = Scanf.scanf "%d " id
let n = get_int ()

let an =
  repeat
    ~f:(fun () ->
      let o = get_int () mod 200 in
      o)
    []
    n
;;

let tbl = Hashtbl.create (module Int)

let rec make_tbl = function
  | [] -> ()
  | a :: an ->
    Hashtbl.update tbl a ~f:(function
        | Some v -> v + 1
        | None -> 1);
    make_tbl an
;;

let () = make_tbl an

let fact a b =
  (* a! / b! *)
  if a < b
  then invalid_arg @@ Printf.sprintf "fact(a=%d, b=%d)" a b
  else (
    let rec aux out a =
      (* a! = a * (a-1)!  *)
      if a = b then out else aux (num_of_int a */ out) (a - 1)
    in
    aux num_one a)
;;

let cab a b =
  let b = max b (a - b) in
  fact a b // fact (a - b) 0
;;

let ans =
  let ks = Hashtbl.keys tbl in
  let rec loop out = function
    | [] -> out
    | k :: ks ->
      let v = Hashtbl.find_exn tbl k in
      let out = out +/ if v < 2 then num_zero else cab v 2 in
      loop out ks
  in
  loop num_zero ks |> string_of_num
;;

let () = ans |> print_endline
