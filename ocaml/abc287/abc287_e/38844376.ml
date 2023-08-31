//##// Contest ID: abc287
//##// Problem ID: abc287_e ( https://atcoder.jp/contests/abc287/tasks/abc287_e )
//##// Title: E. Karuta
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-12 12:38:47 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38844376 ) 

open Core
open IterLabels
module ISet = Set.Make (Int)

let n = Scanf.scanf " %d" Fn.id
let s = Array.init n ~f:(fun _ -> Scanf.scanf " %s" String.to_array)
let ans = Array.init n ~f:(const 0)

let rec calc len set =
  let tbl = Array.init 26 ~f:(const ISet.empty) in
  ISet.iter
    (fun ss ->
      try
        let k = Char.(to_int s.(ss).(len) - to_int 'a') in
        tbl.(k) <- ISet.add ss tbl.(k)
      with Invalid_argument _ -> ans.(ss) <- len)
    set;
  tbl
  |> Array.iter ~f:(fun s ->
         match ISet.cardinal s with
         | 1 -> ans.(ISet.min_elt s) <- len
         | ss when ss >= 2 -> calc (len + 1) s
         | _ -> ())

let () = calc 0 (0 -- (n - 1) |> ISet.of_iter)
let () = ans |> Array.iter ~f:(Printf.printf "%d\n")
