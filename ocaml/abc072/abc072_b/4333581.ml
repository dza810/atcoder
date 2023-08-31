//##// Contest ID: abc072
//##// Problem ID: abc072_b ( https://atcoder.jp/contests/abc072/tasks/abc072_b )
//##// Title: B. OddString
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 15:55:37 +0000 UTC ( https://atcoder.jp/contests/abc072/submissions/4333581 ) 

let () =
  Scanf.scanf "%s" (fun s ->
      let len = String.length s in
      let rec f i =
        match i mod 2 = 0 with
        | _ when i >= len -> ()
        | true ->
            print_char s.[i] ;
            f (i + 1)
        | false -> f (i + 1)
      in
      f 0 ; print_newline () )
