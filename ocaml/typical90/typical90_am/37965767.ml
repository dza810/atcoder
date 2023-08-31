//##// Contest ID: typical90
//##// Problem ID: typical90_am ( https://atcoder.jp/contests/typical90/tasks/typical90_am )
//##// Title: 039. Tree Distance（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-12 14:51:54 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37965767 ) 

open Printf
open Core

(* open Num *)
open IterLabels

module M = struct
  open Scanf

  module Int = struct
    let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

    include Int
  end

  let id = Fn.id
  let si _ = scanf " %d" id
  let sc _ = scanf " %c" id
  let ss _ = scanf " %s" id
  let si2 _ = scanf " %d %d" (fun x y -> (x, y))
  let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
  let pi x = printf "%d\n" x
  let pf x = printf "%0.10f\n" x
  let ps x = printf "%s\n" x
end

open M

(************)

let nn = si ()
let tbl = Hashtbl.create (module Int)

let ab =
  1 -- (nn - 1)
  |> map ~f:(fun _ ->
         let a, b = si2 () in
         Hashtbl.add_multi tbl ~key:a ~data:b;
         Hashtbl.add_multi tbl ~key:b ~data:a;
         (a, b))
  |> to_array

let cache = Hashtbl.create (module Tuple.Hashable_t (Int) (Int))

let rec cnt p np =
  Hashtbl.find_or_add cache (p, np) ~default:(fun () ->
      Hashtbl.find_multi tbl p
      |> List.fold ~init:1 ~f:(fun acc x -> acc + if x = np then 0 else cnt x p))

(* let rec cnt pos pre =
  Hashtbl.find_or_add cache (pos, pre) ~default:(fun () ->
      let ans =
        let bs = Hashtbl.find_multi tbl pos |> List.filter ~f:(fun b -> b <> pre) in
        bs |> List.fold ~init:1 ~f:(fun acc b -> acc + cnt b pos)
        (* match bs with
        | [] -> 1
        | bs -> bs |> List.fold ~init:1 ~f:(fun acc b -> acc + cnt b pos) *)
      in
      ans)
;; *)

let () =
  0 -- (nn - 2)
  |> map ~f:(Array.get ab)
  |> map ~f:(fun (a, b) -> cnt a b)
  |> map ~f:(fun x -> (nn - x) * x)
  |> sum |> pi
