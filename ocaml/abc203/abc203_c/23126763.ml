//##// Contest ID: abc203
//##// Problem ID: abc203_c ( https://atcoder.jp/contests/abc203/tasks/abc203_c )
//##// Title: C. Friends and Travel costs
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-02 06:26:37 +0000 UTC ( https://atcoder.jp/contests/abc203/submissions/23126763 ) 

open Core
open Num

let int_inf = Int.max_value
let id x = x
let num_zero = num_of_int 0
let num_one = num_of_int 1

let repeat ~f =
  let rec loop acc (n : num) =
    if n =/ num_zero then List.rev acc else loop (f () :: acc) (n -/ num_one)
  in
  loop
;;

let get_int () = Scanf.scanf "%i " (fun i -> i |> num_of_int)
let n () = get_int ()
let k () = get_int ()

let abi n =
  repeat
    ~f:(fun () ->
      let a = get_int () in
      let b = get_int () in
      a, b)
    []
    n
  |> List.sort ~compare:(fun (a1, b1) (a2, b2) ->
         let a = compare_num a1 a2 in
         if a = 0 then compare_num b1 b2 else a)
;;

let ans () =
  let n = n () in
  let k = k () in
  let abi = abi n in
  let rec loop (p : num) (k : num) =
    function
    | [] -> k +/ p
    | (a, b) :: tl ->
      let nk = k -/ (a -/ p) in
      if nk </ num_zero (* when cannot get to a *)
      then k +/ p
      else (
        (* when get to a *)
        let k = nk +/ b in
        loop a k tl)
  in
  loop (num_of_int 0) k abi
  |> min_num (power_num (num_of_int 10) (num_of_int 100))
  |> string_of_num
;;

let () = ans () |> print_endline
