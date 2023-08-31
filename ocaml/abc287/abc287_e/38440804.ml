//##// Contest ID: abc287
//##// Problem ID: abc287_e ( https://atcoder.jp/contests/abc287/tasks/abc287_e )
//##// Title: E. Karuta
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-29 04:33:19 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38440804 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let s = Array.init n ~f:(fun _ -> Scanf.scanf " %s" Fn.id)
let ans = Array.init n ~f:(const 0)

let rec loop ss k =
  let prefix_len = Array.init 26 ~f:(const []) in
  ss
  |> List.iter ~f:(fun si ->
       if String.length s.(si) <= k
       then ans.(si) <- k
       else (
         let c = String.nget s.(si) k in
         let key = Char.(to_int c - to_int 'a') in
         prefix_len.(key) <- si :: prefix_len.(key)));
  Array.iter prefix_len ~f:(function
    | [] -> ()
    | [ v ] -> ans.(v) <- k
    | vs -> loop vs (k + 1))
;;

let () = loop (List.init n ~f:Fn.id) 0
let () = Array.iter ans ~f:(fun v -> Printf.printf "%d\n" v)