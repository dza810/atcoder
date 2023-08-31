//##// Contest ID: arc119
//##// Problem ID: arc119_b ( https://atcoder.jp/contests/arc119/tasks/arc119_b )
//##// Title: B. Electric Board
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-05-22 17:41:20 +0000 UTC ( https://atcoder.jp/contests/arc119/submissions/22845689 ) 

open Core

let id x = x
let n = Scanf.scanf "%i " id
let s = Scanf.scanf "%s " String.to_list
let t = Scanf.scanf "%s " String.to_list

let ans () =
  let rec calc sc tc s t out =
    match sc, tc, s, t with
    (* return *)
    | 0, 0, [], [] -> out
    | _, _, [], [] -> -1
    (* loop *)
    | _, _, '1' :: stl, '1' :: ttl -> calc sc tc stl ttl out
    | _, 0, '1' :: stl, '0' :: ttl -> calc (sc + 1) tc stl ttl (out + 1)
    | 0, _, '0' :: stl, '1' :: ttl -> calc sc (tc + 1) stl ttl (out + 1)
    | 0, 0, '0' :: stl, '0' :: ttl -> calc sc tc stl ttl out
    (* bring change *)
    | _, _, '0' :: stl, _ -> calc (sc - 1) tc ('1' :: stl) t out
    | _, _, _, '0' :: ttl -> calc sc (tc - 1) s ('1' :: ttl) out
    | _ -> invalid_arg "ans.calc"
  in
  calc 0 0 s t 0 |> Int.to_string
;;

let () = ans () |> print_endline
