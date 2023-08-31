//##// Contest ID: abc088
//##// Problem ID: abc088_a ( https://atcoder.jp/contests/abc088/tasks/abc088_a )
//##// Title: A. Infinite Coins
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 11:28:46 +0000 UTC ( https://atcoder.jp/contests/abc088/submissions/4330810 ) 

(*ABC 088 A *)
let () =
  Scanf.scanf "%d" (fun n ->
      Scanf.scanf " %d" (fun a ->
          match n mod 500 <= a with true -> "Yes" | false -> "No" )
      |> print_endline )
