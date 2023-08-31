//##// Contest ID: abc287
//##// Problem ID: abc287_e ( https://atcoder.jp/contests/abc287/tasks/abc287_e )
//##// Title: E. Karuta
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-06 07:19:13 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38664962 ) 

open Core
open IterLabels
module Set = Set.Make (String)

let n = Scanf.scanf " %d" Fn.id

let str =
  1 -- n |> map ~f:(fun _ -> Scanf.scanf " %s" Fn.id |> String.to_array) |> to_array
;;

let ans = Array.init n ~f:(const 0)

let rec calc k is =
  let sets = Array.init 26 ~f:(const []) in
  is
  |> List.iter ~f:(fun i ->
       try
         let c = str.(i).(k) in
         let key = Char.(to_int c - to_int 'a') in
         sets.(key) <- i :: sets.(key)
       with
       | Invalid_argument _ -> ans.(i) <- k);
  sets
  |> Array.iter ~f:(function
       | [] -> ()
       | [ i ] -> ans.(i) <- k
       | is -> calc (k + 1) is)
;;

let () =
  calc 0 @@ List.init ~f:Fn.id n;
  Array.iter ~f:(Printf.printf "%d\n") ans
;;
