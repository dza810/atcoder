//##// Contest ID: abc285
//##// Problem ID: abc285_d ( https://atcoder.jp/contests/abc285/tasks/abc285_d )
//##// Title: D. Change Usernames
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-21 17:55:49 +0000 UTC ( https://atcoder.jp/contests/abc285/submissions/38235446 ) 

open Printf
open Core

module M = struct
  open Scanf

  let ( @. ) f g x = f (g x)

  module Int = struct
    let sqrt = Int.of_float @. Float.sqrt @. Float.of_int

    include Int
  end

  let ( .%{} ) hash k = Hashtbl.find hash k
  let ( .%{}<- ) hash key data = Hashtbl.set hash ~key ~data
  let id = Fn.id
  let si _ = scanf " %d" id
  let sc _ = scanf " %c" id
  let ss _ = scanf " %s" id
  let si2 _ = scanf " %d %d" (fun x y -> (x, y))
  let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
  let pi x = printf "%d\n" x
  let pf x = printf "%0.10f\n" x
  let ps x = printf "%s\n" x

  module Num = struct
    include Num

    let sn _ = Scanf.scanf " %s" num_of_string
    let ( %/ ) x y = mod_num x y
    let ( /// ) x y = floor_num @@ (x // y)
    let i2n = num_of_int
    let zero = num_of_int 0
    let one = num_of_int 1
    let two = num_of_int 2

    let rec log10_num ?(ans = 0) x =
      if x =/ zero then ans - 1 else log10_num ~ans:(ans + 1) (x /// i2n 10)

    let rec power_num ~mm v a x =
      if x =/ zero then v
      else if x %/ two =/ zero then power_num ~mm v (mm @@ (a */ a)) (x /// two)
      else power_num ~mm (mm @@ (a */ v)) (mm @@ (a */ a)) (x /// two)
  end
end

open M
open M.Num

(* open IterLabels.Infix *)
open IterLabels

(************)
module StringSet = Set.Make (String)

let nn = si ()
let names = Hashtbl.create (module String)
let rev_names = Hashtbl.create (module String)

let st =
  1 -- nn
  |> map ~f:(fun _ ->
         let s = ss () in
         let t = ss () in
         (s, t))
  |> persistent

let used_names = st |> map ~f:fst |> StringSet.of_iter
let new_names = st |> map ~f:snd |> StringSet.of_iter

let () =
  st
  |> iter ~f:(fun (s, t) ->
         names.%{s} <- t;
         rev_names.%{t} <- s)

let q =
  used_names
  |> StringSet.filter (fun old ->
         let nn = Hashtbl.find_exn names old in
         not @@ StringSet.mem nn used_names)
  |> StringSet.to_list |> Queue.of_list

let rec loop used_names new_names =
  match Queue.dequeue q with
  | None -> StringSet.is_empty new_names
  | Some old ->
      let nn = Hashtbl.find_exn names old in
      let used_names = StringSet.remove old used_names in
      let used_names = StringSet.add nn used_names in
      let new_names = StringSet.remove nn new_names in
      (match Hashtbl.find rev_names old with
      | Some v -> Queue.enqueue q v
      | None -> ());
      loop used_names new_names

let () = ps @@ if loop used_names new_names then "Yes" else "No"
