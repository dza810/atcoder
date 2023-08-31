//##// Contest ID: abc095
//##// Problem ID: abc095_a ( https://atcoder.jp/contests/abc095/tasks/abc095_a )
//##// Title: A. Something on It
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 11:47:17 +0000 UTC ( https://atcoder.jp/contests/abc095/submissions/4330934 ) 

let () =
  Scanf.scanf "%1s%1s%1s" (fun a b c ->
      let rec calc li o =
        match li with
        | [] -> o
        | x :: xs when x = "o" -> calc xs (o + 1)
        | x :: xs -> calc xs o
      in
      (calc [a; b; c] 0 * 100) + 700 |> Printf.printf "%d\n" )
