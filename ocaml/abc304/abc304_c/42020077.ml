//##// Contest ID: abc304
//##// Problem ID: abc304_c ( https://atcoder.jp/contests/abc304/tasks/abc304_c )
//##// Title: C. Virus
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-05 11:11:43 +0000 UTC ( https://atcoder.jp/contests/abc304/submissions/42020077 ) 

open Core
open IterLabels

let n, d = Scanf.scanf " %d %d" Tuple2.create
let xy = Array.init n ~f:(fun _ -> Scanf.scanf " %d %d" Tuple2.create)

let dist2 a b =
  let f g = (g a - g b) * (g a - g b) in
  f fst + f snd

let dist =
  let open Array in
  init n ~f:(fun i ->
      init n ~f:(fun j -> dist2 xy.(i) xy.(j))
      |> filter_mapi ~f:(fun j x -> Option.some_if (x <= d * d) j))

let infected = Array.init n ~f:(Fn.const false)

let rec infect i =
  infected.(i) <- true;
  Array.iter dist.(i) ~f:(fun j -> if not infected.(j) then infect j)

let () = infect 0

let () =
  Array.iter infected ~f:(fun x -> print_endline @@ if x then "Yes" else "No")
