//##// Contest ID: abc051
//##// Problem ID: abc051_b ( https://atcoder.jp/contests/abc051/tasks/abc051_b )
//##// Title: B. Sum of Three Integers
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 10:09:17 +0000 UTC ( https://atcoder.jp/contests/abc051/submissions/4366021 ) 

let count = ref 0

let loop k s =
  for x = 0 to k do
    for y = 0 to k do
      let z = s - x - y in
      if 0 <= z && z <= k then incr count
    done
  done

let () =
  Scanf.scanf "%d %d" loop ;
  Printf.printf "%d\n" !count
