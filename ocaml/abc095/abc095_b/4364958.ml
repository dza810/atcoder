//##// Contest ID: abc095
//##// Problem ID: abc095_b ( https://atcoder.jp/contests/abc095/tasks/abc095_b )
//##// Title: B. Bitter Alchemy
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 08:16:20 +0000 UTC ( https://atcoder.jp/contests/abc095/submissions/4364958 ) 

let list_init n f =
  let rec aux n f l = if n >= 0 then aux (n - 1) f (f n :: l) else l in
  aux (n - 1) f []

let () =
  let n, x = Scanf.scanf "%d %d" (fun n x -> (n, x)) in
  let ms = list_init n (fun _ -> Scanf.scanf " %d" (fun m -> m)) in
  let min_m = List.fold_left min (List.hd ms) ms in
  let sum_m = List.fold_left ( + ) 0 ms in
  let x = x - sum_m in
  let n = n + (x / min_m) in
  Printf.printf "%d\n" n