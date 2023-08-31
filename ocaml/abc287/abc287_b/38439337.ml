//##// Contest ID: abc287
//##// Problem ID: abc287_b ( https://atcoder.jp/contests/abc287/tasks/abc287_b )
//##// Title: B. Postal Card
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-29 03:19:29 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38439337 ) 

open Core
open IterLabels

let n, m = Scanf.scanf " %d %d" Tuple2.create
let s = Array.init n ~f:(fun _ -> Scanf.scanf " %s" Fn.id)
let t = Array.init m ~f:(fun _ -> Scanf.scanf " %s" Fn.id)

let () =
  let v =
    s
    |> Array.map ~f:(fun s ->
         let sl3 = String.sub s ~pos:3 ~len:3 in
         Array.mem t sl3 ~equal:String.equal)
    |> Array.count ~f:Fn.id
  in
  Printf.printf "%d\n" v
;;
