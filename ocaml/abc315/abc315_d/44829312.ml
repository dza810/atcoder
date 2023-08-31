//##// Contest ID: abc315
//##// Problem ID: abc315_d ( https://atcoder.jp/contests/abc315/tasks/abc315_d )
//##// Title: D. Magical Cookies
//##// Language: OCaml (ocamlopt 5.0.0)
//##// Submitted: 2023-08-21 14:52:19 +0000 UTC ( https://atcoder.jp/contests/abc315/submissions/44829312 ) 

open IterLabels
open Core

let find_aux fx h wc x =
  0 -- (h - 1)
  |> filter ~f:(fun hh -> not fx.(hh))
  |> fold ~init:[] ~f:(fun q hh ->
         0 -- 25
         |> filter ~f:(fun cc -> x.(hh).(cc) = wc && wc >= 2)
         |> fold ~init:q ~f:(fun q cc -> (hh, cc) :: q))

let mark_aux q hc fx y w =
  List.fold q ~init:hc ~f:(fun hc (hh, cc) ->
      fx.(hh) <- true;
      (0 -- (w - 1)) (fun ww -> y.(ww).(cc) <- y.(ww).(cc) - 1);
      hc - 1)

let h, w = Scanf.scanf " %d %d" Tuple2.create

let c =
  Array.init h ~f:(fun _ -> Array.init w ~f:(fun _ -> Scanf.scanf " %c" Fn.id))

let x = Array.make_matrix ~dimx:h ~dimy:26 0
let y = Array.make_matrix ~dimx:w ~dimy:26 0
let fx = Array.create ~len:h false
let fy = Array.create ~len:w false

let () =
  (0 -- (h - 1)) (fun hh ->
      (0 -- (w - 1)) (fun ww ->
          x.(hh).(Char.(to_int c.(hh).(ww) - to_int 'a')) <-
            x.(hh).(Char.(to_int c.(hh).(ww) - to_int 'a')) + 1;
          y.(ww).(Char.(to_int c.(hh).(ww) - to_int 'a')) <-
            y.(ww).(Char.(to_int c.(hh).(ww) - to_int 'a')) + 1))

let rec f hc wc cnt =
  let qx = find_aux fx h wc x in
  let qy = find_aux fy w hc y in
  let hc = mark_aux qx hc fx y w in
  let wc = mark_aux qy wc fy x h in
  if cnt > 1 then f hc wc (cnt - 1) else hc * wc

let () = Printf.printf "%d\n" @@ f h w (h + w)
