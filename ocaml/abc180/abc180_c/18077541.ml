//##// Contest ID: abc180
//##// Problem ID: abc180_c ( https://atcoder.jp/contests/abc180/tasks/abc180_c )
//##// Title: C. Cream puff
//##// Language: OCaml (4.10.0)
//##// Submitted: 2020-11-13 10:28:46 +0000 UTC ( https://atcoder.jp/contests/abc180/submissions/18077541 ) 

open Batteries

let () =
  let open Int64 in
  let n = Scanf.scanf " %s" of_string in
  let rec f acc x =
    if x * x < n
    then (
      let acc =
        if modulo n x = zero
        then (
          Printf.printf "%Ld\n" x;
          (n / x) :: acc)
        else acc
      in
      f acc (x + one))
    else if x * x = n
    then ( Printf.printf "%Ld\n" x; acc )
    else acc
  in
  let acc = f [] one in
  List.iter (fun x -> Printf.printf "%Ld\n" x) acc
;;

;;
Printf.printf "%!"
