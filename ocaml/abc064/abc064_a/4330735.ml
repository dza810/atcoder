//##// Contest ID: abc064
//##// Problem ID: abc064_a ( https://atcoder.jp/contests/abc064/tasks/abc064_a )
//##// Title: A. RGB Cards
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 11:17:23 +0000 UTC ( https://atcoder.jp/contests/abc064/submissions/4330735 ) 

(* ABC 064 A *)

let () =
  Scanf.scanf "%1d %1d %1d" (fun _ t o ->
      (match ((t * 10) + o) mod 4 with 0 -> "YES" | _ -> "NO")
      |> print_endline )
