//##// Contest ID: abc090
//##// Problem ID: abc090_b ( https://atcoder.jp/contests/abc090/tasks/abc090_b )
//##// Title: B. Palindromic Numbers
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 11:30:36 +0000 UTC ( https://atcoder.jp/contests/abc090/submissions/4366753 ) 

let calc s e =
  let rec aux i c =
    if i < s || e < i then c
    else if i / 10000 <> i mod 10 then aux (i + 1) c
    else
      let i2 = i / 10 mod 1000 in
      if i2 / 100 <> i2 mod 10 then aux (i + 1) c else aux (i + 1) (c + 1)
  in
  aux s 0

let () = Scanf.scanf "%d %d" calc |> Printf.printf "%d\n"
