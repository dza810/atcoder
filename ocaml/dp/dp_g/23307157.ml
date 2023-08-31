//##// Contest ID: dp
//##// Problem ID: dp_g ( https://atcoder.jp/contests/dp/tasks/dp_g )
//##// Title: G. Longest Path
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-09 05:58:36 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23307157 ) 

open Core

let int_inf = Int.max_value
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let get_int () = Scanf.scanf "%d " id
let n = get_int ()
let m = get_int ()
let xy = Array.init (n + 1) ~f:(fun _ -> [])
let add x y = xy.(x) <- y :: xy.(x)

let (_ : _) =
  Array.init m ~f:(fun _ ->
      let x = get_int () in
      let y = get_int () in
      add x y)
;;

let dp_tbl = Hashtbl.create (module Int)

let rec dp x =
  Hashtbl.find_or_add dp_tbl x ~default:(fun () ->
      xy.(x) |> List.map ~f:(fun x -> 1 + dp x) |> List.fold ~f:Int.max ~init:0)
;;

let ans =
  List.init (n + 1) ~f:(fun x -> dp x) |> List.fold ~init:0 ~f:Int.max |> Int.to_string
;;

let () = ans |> print_endline
