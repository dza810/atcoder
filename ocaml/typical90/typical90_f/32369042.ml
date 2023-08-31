//##// Contest ID: typical90
//##// Problem ID: typical90_f ( https://atcoder.jp/contests/typical90/tasks/typical90_f )
//##// Title: 006. Smallest Subsequence（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-11 09:12:08 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32369042 ) 

open Core
open Num

let id x = x
let si _ = Scanf.scanf " %d" id
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ( -- ) s e = List.init (e - s) ~f:(( + ) s)
let ( >>| ) x f = List.map ~f x
let ( >|| ) x f = List.iter ~f x
let ( >>= ) x f = List.bind ~f x
let fold f init x = List.fold ~f ~init x

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let nn = si ()
let kk = si ()
let ss = ss () |> String.to_array

let () =
  let s = ref 0 in
  let ans = ref [] in
  for i = 0 to kk - 1 do
    let min_c = ref '}' in
    for j = !s to nn - kk + i do
      if Char.(!min_c > ss.(j))
      then (
        min_c := ss.(j);
        s := j + 1)
    done;
    ans := !min_c :: !ans
  done;
  !ans |> List.rev |> String.of_char_list |> print_endline
;;
