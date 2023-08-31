//##// Contest ID: abc080
//##// Problem ID: abc080_b ( https://atcoder.jp/contests/abc080/tasks/abc080_b )
//##// Title: B. Harshad Number
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 10:56:50 +0000 UTC ( https://atcoder.jp/contests/abc080/submissions/4366450 ) 

let f x =
  let rec aux x s = if x < 10 then s + x else aux (x / 10) (s + (x mod 10)) in
  aux x 0

let () =
  let n = read_int () in
  (if n mod f n = 0 then "Yes" else "No") |> print_endline
