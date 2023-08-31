//##// Contest ID: typical90
//##// Problem ID: typical90_h ( https://atcoder.jp/contests/typical90/tasks/typical90_h )
//##// Title: 008. AtCounter（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-10 05:04:49 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37917976 ) 

open Printf
open Num
open Scanf
open IterLabels
open Core

module Int = struct
  let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

  include Int
end

let rec bin_search ~f l r =
  (* `f l` is always true, `f r` is always false *)
  if r - l <= 1 then l
  else
    let c = ((r - l) / 2) + l in
    if f c then bin_search ~f c r else bin_search ~f l c

let id x = x
let si _ = scanf " %d" id
let sc _ = scanf " %c" id
let ss _ = scanf " %s" id
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
let nn = si ()
let str = ss () |> String.to_array
let atcoder = String.to_array "atcoder"
let mm x = x % 1_000_000_007

let rec loop dp i =
  if i = nn then ()
  else
    let () =
      match Array.findi atcoder ~f:(fun _ x -> Char.(x = str.(i))) with
      | Some (n, _) ->
          dp.(i).(n) <-
            mm (if n = 0 then 1 else if i - 1 < 0 then 0 else dp.(i-1).(n-1))
      | None -> ()
    in
    let () =
      if i > 0 then
        for n = 0 to 6 do
          dp.(i).(n) <- mm @@ (dp.(i - 1).(n) + dp.(i).(n))
        done
    in
    loop dp (i + 1)

let () =
  let dp = Array.init nn ~f:(fun _ -> Array.init 7 ~f:(fun _ -> 0)) in
  loop dp 0;
  pi @@ dp.(nn - 1).(6)
