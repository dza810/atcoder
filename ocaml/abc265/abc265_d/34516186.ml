//##// Contest ID: abc265
//##// Problem ID: abc265_d ( https://atcoder.jp/contests/abc265/tasks/abc265_d )
//##// Title: D. Iroha and Haiku (New ABC Edition)
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-02 15:54:22 +0000 UTC ( https://atcoder.jp/contests/abc265/submissions/34516186 ) 

open Core
open Printf

(* open Num *)
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id

(* let ss _ = Scanf.scanf " %s" id *)
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f
(************)

let nn = si ()
let pp = si ()
let qq = si ()
let rr = si ()
let aa = 0 -- (nn - 1) >|= si |> to_list

let s =
  0 :: aa |> List.folding_map ~init:0 ~f:(fun acc x -> acc + x, acc + x) |> Array.of_list
;;

let cum = Hashtbl.create (module Int)
let () = s |> Array.iteri ~f:(fun i x -> Hashtbl.add_exn cum ~key:x ~data:i)

let () =
  let flg =
    0 -- (nn - 3)
    >|= (fun x ->
          let open Option in
          Hashtbl.find cum (pp + s.(x))
          >>= fun y ->
          Hashtbl.find cum (qq + s.(y))
          >>= fun z -> Hashtbl.find cum (rr + s.(z)) >>= fun _ -> return @@ true)
    |> keep_some
    |> exists ~f:id
  in
  ps @@ if flg then "Yes" else "No"
;;
