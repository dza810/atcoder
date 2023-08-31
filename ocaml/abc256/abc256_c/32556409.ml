//##// Contest ID: abc256
//##// Problem ID: abc256_c ( https://atcoder.jp/contests/abc256/tasks/abc256_c )
//##// Title: C. Filling 3x3 array
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-18 12:37:45 +0000 UTC ( https://atcoder.jp/contests/abc256/submissions/32556409 ) 

open Core

(* open Num *)
(* open IterLabels *)

let id x = x
let si _ = Scanf.scanf " %d" id

(* let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y) *)
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let option_either l ~f =
  List.fold l ~init:None ~f:(fun acc x ->
      match acc with
      | None -> f x
      | Some x -> Some x)
;;

(************)

let h1, h2, h3 = si3 ()
let w1, w2, w3 = si3 ()


let line h1 f = (1 -- h1) |> fold ~init:0 ~f:(fun acc1 a11 ->
  let x = 1 -- (h1 - a11) |> fold ~init:0 ~f:(fun acc2 a12 ->
    let a13 = h1 - a11 - a12 in
    acc2 + if a13 >= 1 then f a11 a12 a13 else 0
  )
  in x + acc1
)
  ;;
let check a11 a12 a13 a21 a22 a23 a31 a32 a33 =
 if a11 + a21 + a31 = w1 && a12 + a22 + a32 = w2 && a13 + a23 + a33 = w3 then 1 else 0
;;

let () =
  line h1 (fun a11 a12 a13 ->
    line h2 (fun a21 a22 a23 ->
      line h3 (fun a31 a32 a33 ->
        check a11 a12 a13 a21 a22 a23 a31 a32 a33
      )
    ) 
  )  |> pi