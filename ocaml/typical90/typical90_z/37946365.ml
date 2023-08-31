//##// Contest ID: typical90
//##// Problem ID: typical90_z ( https://atcoder.jp/contests/typical90/tasks/typical90_z )
//##// Title: 026. Independent Set on a Tree（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-11 13:57:18 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37946365 ) 

open Printf
open Scanf
open IterLabels
open Core
open Num

module Int = struct
  let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

  include Int
end

module Array = struct
  include Array

  let ( .%{} ) arr i =
    try nget arr i
    with _ as e ->
      eprintf "(length=%d, idx=%d)" (length arr) i;
      raise e

  let ( .%{}<- ) = set
end

module M = struct
  let id x = x
  let si _ = scanf " %d" id
  let sc _ = scanf " %c" id
  let ss _ = scanf " %s" id
  let sn _ = scanf " %s" num_of_string
  let si2 _ = scanf " %d %d" (fun x y -> (x, y))
  let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
  let pi ?(list = false) x = if list then eprintf " %d;" x else printf "%d\n" x

  let pf ?(list = false) x =
    if list then eprintf " %0.10f;" x else printf "%0.10f\n" x

  let ps ?(list = false) x = if list then eprintf " %s;" x else printf "%s\n" x

  let pa ~p l =
    eprintf "[";
    Array.iter l ~f:(fun x -> p ?list:(Some true) x);
    eprintf "]"

  let pl ~prefix ~p l =
    eprintf "%s [" prefix;
    List.iter l ~f:(fun x -> p ?list:(Some true) x);
    eprintf "]\n";
    l

  let rec bin_search ~f l r =
    (* `f l` is always true, `f r` is always false *)
    if r - l <= 1 then l
    else
      let c = ((r - l) / 2) + l in
      if f c then bin_search ~f c r else bin_search ~f l c

  let ( %/ ) x y = mod_num x y
  let i2n = num_of_int
  let zero = num_of_int 0
  let one = num_of_int 1
  let two = num_of_int 2
end

open M

(************)

let nn = si ()
let tbl = Hashtbl.create (module Int)

let () =
  for _ = 1 to nn - 1 do
    let a, b = si2 () in
    Hashtbl.add_multi tbl ~key:a ~data:b;
    Hashtbl.add_multi tbl ~key:b ~data:a
  done

let arr = Array.create ~len:(nn + 1) 0

let rec dfs ?(color = 1) p =
  if arr.(p) = 0 then (
    arr.(p) <- color;
    Hashtbl.find_multi tbl p |> List.iter ~f:(dfs ~color:(-color)))

let rec pp ?(i = nn / 2) l =
  if i = 1 then printf "%d\n" l.((nn / 2) - i)
  else (
    printf "%d " l.((nn / 2) - i);
    pp l ~i:(i - 1))

let () =
  let () = dfs 1 in
  let p =
    arr |> Array.filter_mapi ~f:(fun i x -> if x = 1 then Some i else None)
  in
  if Array.length p >= nn / 2 then pp p
  else
    let p =
      arr |> Array.filter_mapi ~f:(fun i x -> if x = -1 then Some i else None)
    in
    let () = pa ~p:pi p in
    pp p
