//##// Contest ID: abc283
//##// Problem ID: abc283_d ( https://atcoder.jp/contests/abc283/tasks/abc283_d )
//##// Title: D. Scope
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-30 12:24:50 +0000 UTC ( https://atcoder.jp/contests/abc283/submissions/38485797 ) 

open Core
open IterLabels

let s = Scanf.scanf " %s" Fn.id |> String.to_array
let len_s = Array.length s

module CSet = Set.Make (Char)

let rec loop box (l : _ list) i =
  if i = len_s
  then true
  else if Char.('a' <= s.(i) && s.(i) <= 'z')
  then
    if CSet.mem s.(i) box
    then false
    else (
      let box = CSet.add s.(i) box in
      let l =
        match l with
        | hd :: tl -> CSet.add s.(i) hd :: tl
        | _ -> failwith ""
      in
      loop box l (i + 1))
  else if Char.(s.(i) = '(')
  then loop box (CSet.empty :: l) (i + 1)
  else if Char.(s.(i) = ')')
  then (
    let l, box =
      match l with
      | hd :: tl -> tl, CSet.fold (fun c box -> CSet.remove c box) hd box
      | _ -> failwith ""
    in
    loop box l (i + 1))
  else failwith ""
;;

let () = print_endline @@ if loop CSet.empty [ CSet.empty ] 0 then "Yes" else "No"
