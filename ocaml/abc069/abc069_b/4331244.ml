//##// Contest ID: abc069
//##// Problem ID: abc069_b ( https://atcoder.jp/contests/abc069/tasks/abc069_b )
//##// Title: B. i18n
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 12:17:22 +0000 UTC ( https://atcoder.jp/contests/abc069/submissions/4331244 ) 

let () =
  Scanf.scanf "%s" (fun s ->
      let len = String.length s in
      let h = s.[0] in
      let t = s.[len - 1] in
      Printf.printf "%c%d%c\n" h (len - 2) t )
