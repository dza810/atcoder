//##// Contest ID: abc053
//##// Problem ID: abc053_b ( https://atcoder.jp/contests/abc053/tasks/abc053_b )
//##// Title: B. A to Z String
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 16:08:03 +0000 UTC ( https://atcoder.jp/contests/abc053/submissions/4333654 ) 

let () =
  Scanf.scanf "%s" (fun s ->
      let st = String.index s 'A' in
      let e = String.rindex s 'Z' in
      Printf.printf "%d\n" (e - st + 1) )
