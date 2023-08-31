//##// Contest ID: abc254
//##// Problem ID: abc254_c ( https://atcoder.jp/contests/abc254/tasks/abc254_c )
//##// Title: C. K Swap
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-07 06:05:49 +0000 UTC ( https://atcoder.jp/contests/abc254/submissions/42053102 ) 

open IterLabels
open Core

let n, k = Scanf.scanf " %d %d" Tuple2.create
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let ak = Array.init k ~f:(Fn.const [])
let () = Array.iteri a ~f:(fun i x -> ak.(i % k) <- x :: ak.(i % k))
let ak = Array.map ~f:(List.sort ~compare:Int.compare) ak
let ans = Array.init n ~f:(Fn.const (-1))

let () =
  Array.iteri ak ~f:(fun kk l ->
      List.iteri l ~f:(fun i v -> ans.(kk + (k * i)) <- v))

let () =
    print_endline @@ if Array.is_sorted ~compare:Int.compare ans then "Yes" else "No"
