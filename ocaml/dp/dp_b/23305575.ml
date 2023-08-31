//##// Contest ID: dp
//##// Problem ID: dp_b ( https://atcoder.jp/contests/dp/tasks/dp_b )
//##// Title: B. Frog 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-09 03:34:04 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23305575 ) 

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
let k = get_int ()
let h = Array.init n ~f:(fun _ -> Scanf.scanf "%d " id)
let calc i j = Int.abs (h.(i) - h.(j))

let dp x =
  let tbl = Hashtbl.create (module Int) in
  let () = Hashtbl.add_exn tbl ~key:0 ~data:0 in
  let rec dp x =
    Hashtbl.find_or_add tbl x ~default:(fun () ->
        let rec aux out = function
          | 0 -> out
          | k ->
            let out =
              if x - k >= 0 then Int.min out (dp (x - k) + calc x (x - k)) else out
            in
            aux out (k - 1)
        in
        aux int_inf k)
  in
  dp x
;;

let ans = dp (n - 1) |> Int.to_string
let () = ans |> print_endline
