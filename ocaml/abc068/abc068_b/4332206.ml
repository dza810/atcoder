//##// Contest ID: abc068
//##// Problem ID: abc068_b ( https://atcoder.jp/contests/abc068/tasks/abc068_b )
//##// Title: B. Break Number
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 13:37:04 +0000 UTC ( https://atcoder.jp/contests/abc068/submissions/4332206 ) 

let calc n =
  let rec f i = match i > n with false -> f (i * 2) | true -> i / 2 in
  f 1

let () = Scanf.scanf "%d" (fun n -> calc n |> Printf.printf "%d\n")
