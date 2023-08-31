//##// Contest ID: abc189
//##// Problem ID: abc189_d ( https://atcoder.jp/contests/abc189/tasks/abc189_d )
//##// Title: D. Logical Expression
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-01-28 01:51:20 +0000 UTC ( https://atcoder.jp/contests/abc189/submissions/19731053 ) 

open Core

type op =
  | And
  | Or

let int_inf = 10000000000
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let power =
  let rec aux out x = function
    | 0 -> out
    | n -> if n mod 2 = 0 then aux out (x * x) (n / 2) else aux (out * x) x (n - 1)
  in
  aux 1
;;

let n = read_int ()

let xs =
  repeat
    (fun () ->
      Scanf.scanf "%s " (fun x -> if String.compare x "AND" = 0 then And else Or))
    []
    n
;;

let ans =
  let tn, fn =
    List.fold_left xs ~init:(1, 1) ~f:(fun (tn, fn) x ->
        match x with
        | And -> tn, tn + (fn * 2)
        | Or -> (2 * tn) + fn, fn)
  in
  (* Printf.printf "tn=%d, fn=%d, total=%d, %d" tn fn (tn + fn) (power 2 (n + 1)); *)
  Printf.sprintf "%d" tn
;;

let () = print_endline ans
