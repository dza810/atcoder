//##// Contest ID: abc201
//##// Problem ID: abc201_b ( https://atcoder.jp/contests/abc201/tasks/abc201_b )
//##// Title: B. Do you know the second highest mountain?
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-05 10:21:04 +0000 UTC ( https://atcoder.jp/contests/abc201/submissions/23185981 ) 

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
let get_string () = Scanf.scanf "%s " id
let n = get_int ()
let tbl = Hashtbl.create (module Int)

let xs =
  repeat
    ~f:(fun () ->
      let s = get_string () in
      let t = get_int () in
      Hashtbl.add_exn tbl ~key:t ~data:s)
    []
    n
;;

let ans =
  let ts = Hashtbl.keys tbl |> List.sort ~compare:(fun x y -> Int.compare y x) in
  match ts with
  | _ :: s :: _ -> Hashtbl.find_exn tbl s
  | _ -> invalid_arg "ans"
;;

let () = ans |> print_endline
