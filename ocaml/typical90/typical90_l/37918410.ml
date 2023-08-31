//##// Contest ID: typical90
//##// Problem ID: typical90_l ( https://atcoder.jp/contests/typical90/tasks/typical90_l )
//##// Title: 012. Red Painting（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-10 05:32:23 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37918410 ) 

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

let hh, ww = si2 ()
let qq = si ()

let red = Array.make_matrix ~dimx:(hh + 1) ~dimy:(ww + 1) false
let par = Array.init (hh * ww) ~f:id
let coor (r, c) = ((r - 1) * ww) + (c - 1)

let rec get_par pa =
  if pa = par.(pa) then pa
  else (
    par.(pa) <- get_par par.(pa);
    par.(pa))

let join pa pb =
  let pa = get_par @@ coor pa in
  let pb = get_par @@ coor pb in
  par.(pa) <- par.(pb)

let is_connected pa pb = get_par @@ coor pa = get_par @@ coor pb

let color (rr, cc) =
  red.(rr).(cc) <- true;
  let d = [ (0, 1); (0, -1); (1, 0); (-1, 0) ] in
  d
  |> List.map ~f:(fun (dr, dc) ->
         let r, c = (rr + dr, cc + dc) in
         if 1 <= r && r <= hh && 1 <= c && c <= ww && red.(r).(c) then
           join (rr, cc) (r, c))
  |> ignore

let rec loop qq =
  if qq = 0 then ()
  else
    let t = si () in
    let () =
      match t with
      | 1 ->
          let rc = si2 () in
          color rc
      | 2 ->
          let ((ra, ca) as aa) = si2 () in
          let ((rb, cb) as bb) = si2 () in
          ps
          @@
          if red.(ra).(ca) && red.(rb).(cb) && is_connected aa bb then "Yes"
          else "No"
      | _ -> failwith ""
    in
    loop (qq - 1)

let () = loop qq
