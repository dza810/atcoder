//##// Contest ID: abc200
//##// Problem ID: abc200_d ( https://atcoder.jp/contests/abc200/tasks/abc200_d )
//##// Title: D. Happy Birthday! 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-06 06:26:33 +0000 UTC ( https://atcoder.jp/contests/abc200/submissions/23202517 ) 

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

let get_int () = Scanf.scanf "%d " id
let n = get_int ()
let an = repeat ~f:(fun () -> get_int ()) [] n
let tbl = Array.init 200 ~f:(fun _ -> 0)

let list_filter b n xs =
  let rec aux b n xs =
    if n = 0
    then []
    else (
      match xs with
      | [] -> []
      | x :: xs ->
        if b mod 2 = 1 then x :: aux (b / 2) (n - 1) xs else aux (b / 2) (n - 1) xs)
  in
  aux b n xs
;;

let to_bc i =
  let rec aux out n i =
    if i = 0
    then out
    else (
      let out = if i mod 2 = 1 then n :: out else out in
      aux out (n + 1) (i / 2))
  in
  aux [] 1 i |> List.rev
;;

let rec list_to_string = function
  | [] -> ""
  | [ x ] -> Printf.sprintf "%d" x
  | x :: xs -> Printf.sprintf "%d " x ^ list_to_string xs
;;

let ans =
  let l = min 8 n in
  let rec aux c =
    if c >= (Int.pow 2 l)
    then None
    else (
      let sum =
        an |> list_filter c l |> List.fold ~init:0 ~f:(fun acc x -> (acc + x) mod 200)
      in
      if tbl.(sum) <> 0
      then Some (c, tbl.(sum))
      else (
        tbl.(sum) <- c;
        aux (c + 1)))
  in
  match aux 0 with
  | None -> print_endline "No"
  | Some (c, b) ->
    let b = to_bc b in
    let c = to_bc c in
    let x = List.length b in
    let y = List.length c in
    Printf.printf "Yes\n%d %s\n%d %s\n" x (list_to_string b) y (list_to_string c)
;;

(* let () = ans |> print_endline *)
