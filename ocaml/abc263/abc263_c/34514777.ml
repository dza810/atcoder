//##// Contest ID: abc263
//##// Problem ID: abc263_c ( https://atcoder.jp/contests/abc263/tasks/abc263_c )
//##// Title: C. Monotonically Increasing
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 14:32:39 +0000 UTC ( https://atcoder.jp/contests/abc263/submissions/34514777 ) 

open Core
open Printf

(* open Num *)
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d \n" x else printf "%d " x;
        acc - 1)
  in
  ()
;;

(************)
let nn = si ()
let mm = si ()

let rec comb n lst =
  if n = 0
  then return @@ []
  else (
    let rec inner = function
      | [] -> empty
      | x :: xs -> append (comb (n - 1) xs >|= fun l -> x :: l) (inner xs)
    in
    inner lst)
;;

let () =
  (comb nn (1 -- mm |> to_list)) |> iter ~f:pl