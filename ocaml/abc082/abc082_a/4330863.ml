//##// Contest ID: abc082
//##// Problem ID: abc082_a ( https://atcoder.jp/contests/abc082/tasks/abc082_a )
//##// Title: A. Round Up the Mean
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 11:36:38 +0000 UTC ( https://atcoder.jp/contests/abc082/submissions/4330863 ) 

let () =
  Scanf.scanf "%d %d" (fun a b ->
      let m = (a + b) / 2 in
      (match (a + b) mod 2 with 0 -> m | 1 -> m + 1) |> Printf.printf "%d\n" )
