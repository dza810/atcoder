//##// Contest ID: typical90
//##// Problem ID: typical90_d ( https://atcoder.jp/contests/typical90/tasks/typical90_d )
//##// Title: 004. Cross Sum（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-10 04:00:52 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37917120 ) 

open Printf
open Num
open Scanf
open IterLabels
open Core

module Int = struct
  let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

  include Int
end

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let ss _ = scanf " %c" id
let sn _ = scanf " %s" num_of_string
let si2 _ = scanf " %d %d" (fun x y -> (x, y))
let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
let pi ?(list = false) x = if list then eprintf " %d;" x else printf "%d\n" x
let pf ?(list = false) x = if list then eprintf " %f;" x else printf "%f\n" x
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

let ( %/ ) x y = mod_num x y
let i2n = num_of_int
let zero = num_of_int 0
let one = num_of_int 1
let two = num_of_int 2

(************)

let hh, ww = si2 ()
let aa = Array.init hh ~f:(fun _ -> Array.init ww ~f:si)
let h = Array.init hh ~f:(fun h -> aa.(h) |> Array.fold ~init:0 ~f:( + ))

let w =
  Array.init ww ~f:(fun w ->
      aa |> Array.map ~f:(fun h -> h.(w)) |> Array.fold ~init:0 ~f:( + ))

let () =
  for i = 0 to hh - 1 do
    for j = 0 to ww - 1 do
      let v = h.(i) + w.(j) - aa.(i).(j) in
      if j = ww - 1 then printf "%d\n" v else printf "%d " v
    done
  done
