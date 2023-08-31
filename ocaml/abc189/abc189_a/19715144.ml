//##// Contest ID: abc189
//##// Problem ID: abc189_a ( https://atcoder.jp/contests/abc189/tasks/abc189_a )
//##// Title: A. Slot
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-01-27 00:50:29 +0000 UTC ( https://atcoder.jp/contests/abc189/submissions/19715144 ) 

open Batteries

let int_inf = 10000000000
let id x = x

let repeat f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let xs = repeat (fun () -> Scanf.scanf "%c" id) [] 3

let () =
  let c1 = List.hd xs in
  if List.fold_left (fun acc x -> acc && x = c1) true (List.tl xs) then
    print_endline "Won"
  else
    print_endline "Lost"
    
