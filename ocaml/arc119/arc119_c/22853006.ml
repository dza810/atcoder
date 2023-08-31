//##// Contest ID: arc119
//##// Problem ID: arc119_c ( https://atcoder.jp/contests/arc119/tasks/arc119_c )
//##// Title: C. ARC Wrecker 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-05-23 04:22:10 +0000 UTC ( https://atcoder.jp/contests/arc119/submissions/22853006 ) 

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

let n = Scanf.scanf "%i " (fun i -> i)
let an = repeat ~f:(fun () -> Scanf.scanf "%d " id) [] n

let ans () =
  let cx =
    let cx =
      List.folding_mapi an ~init:0 ~f:(fun i acc x ->
          let cx = acc + (((2 * (i mod 2)) - 1) * x) in
          cx, cx)
    in
    0 :: cx
  in
  let tbl = Hashtbl.create (module Int) in
  let rec calc cx count =
    match cx with
    | [] -> count
    | c :: cx ->
      let v =
        match Hashtbl.find tbl c with
        | Some v -> v
        | None -> 0
      in
      Hashtbl.incr tbl c;
      calc cx (count + v)
  in
  let ans =
    match cx with
    | c1 :: c2 :: cx ->
      Hashtbl.incr tbl c1;
      Hashtbl.incr tbl c2;
      calc cx 0
    | _ -> invalid_arg "ans"
  in
  ans |> Int.to_string
;;

let () = ans () |> print_endline
