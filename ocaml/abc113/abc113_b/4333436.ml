//##// Contest ID: abc113
//##// Problem ID: abc113_b ( https://atcoder.jp/contests/abc113/tasks/abc113_b )
//##// Title: B. Palace
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 15:33:08 +0000 UTC ( https://atcoder.jp/contests/abc113/submissions/4333436 ) 

let () =
  let n = Scanf.scanf "%d" (fun n -> n) in
  let t = Scanf.scanf " %d %d" (fun t a -> (a - t) * 1000) in
  let hs =
    Array.init n (fun i ->
        (Scanf.scanf " %d" (fun h -> abs ((6 * h) + t)), i + 1) )
  in
  let ans, _ =
    Array.fold_left
      (fun (ans, min_h) (h, ind) ->
        if min_h < h then (ans, min_h) else (ind, h) )
      (1, fst hs.(0))
      hs
  in
  Printf.printf "%d\n" ans
