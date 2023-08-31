//##// Contest ID: abc085
//##// Problem ID: abc085_a ( https://atcoder.jp/contests/abc085/tasks/abc085_a )
//##// Title: A. Already 2018
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 12:07:13 +0000 UTC ( https://atcoder.jp/contests/abc085/submissions/4331133 ) 

let () =
  Scanf.scanf "%s" (fun s ->
      let p = String.sub s 0 3 in
      let t = String.sub s 4 6 in
      print_endline (p ^ "8" ^ t) )
