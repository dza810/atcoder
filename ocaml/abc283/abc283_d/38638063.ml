//##// Contest ID: abc283
//##// Problem ID: abc283_d ( https://atcoder.jp/contests/abc283/tasks/abc283_d )
//##// Title: D. Scope
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-05 05:18:10 +0000 UTC ( https://atcoder.jp/contests/abc283/submissions/38638063 ) 

open Core
open IterLabels
module CSet = Set.Make (Char)

let () =
  let all = ref CSet.empty in
  let sets = Stack.singleton CSet.empty in
  Scanf.scanf " %s" Fn.id
  |> String.iter ~f:(fun c ->
       match c with
       | '(' -> Stack.push sets CSet.empty
       | ')' -> all := CSet.diff !all (Stack.pop_exn sets)
       | c ->
         if CSet.mem c !all
         then (
           print_endline "No";
           exit 0);
         let hd = Stack.pop_exn sets in
         all := CSet.add c !all;
         Stack.push sets (CSet.add c hd));
  print_endline "Yes"
;;
