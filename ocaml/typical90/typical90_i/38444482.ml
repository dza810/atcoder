//##// Contest ID: typical90
//##// Problem ID: typical90_i ( https://atcoder.jp/contests/typical90/tasks/typical90_i )
//##// Title: 009. Three Point Angle（★6）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-29 07:08:35 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38444482 ) 

open Core
open IterLabels

let ( %. ) x y =
  let m = Float.mod_float in
  m (m x y +. y) y
;;

type point =
  { x : int
  ; y : int
  }

let ( -/ ) x y = { x = x.x - y.x; y = x.y - y.y }
let n = Scanf.scanf " %d" Fn.id

let points =
  Array.init n ~f:(fun _ ->
    let x, y = Scanf.scanf " %d %d" Tuple2.create in
    { x; y })
;;

let calc ~base =
  let points =
    let base = points.(base - 1) in
    points |> Array.map ~f:(fun i -> i -/ base)
  in
  let angles =
    points
    |> Array.filter_mapi ~f:(fun i { x; y } ->
         if i = base - 1
         then None
         else (
           let a = Float.atan2 (Float.of_int y) (Float.of_int x) in
           let a = ((a *. 180. /. Float.pi) +. 360.) %. 360. in
           Some a))
  in
  let () = angles |> Array.sort ~compare:Float.compare in
  let n = n - 1 in
  angles
  |> Array.map ~f:(fun i ->
       match
         Array.binary_search
           ~compare:Float.compare
           angles
           `Last_less_than_or_equal_to
           ((i +. 180.) %. 360.)
       with
       | Some j ->
         let v j =
           let j = (j + n) % n in
           let v = Float.abs (angles.(j) -. i) in
           if Float.(v >= 180.) then 360. -. v else v
         in
         let v1 = v j in
         let v2 = v (j + 1) in
         let v3 = v (j - 1) in
         [ v1; v2; v3 ] |> of_list |> max_exn ?lt:None
       | None -> 0.)
  |> Array.fold ~init:(-1.) ~f:Float.max
;;

let () =
  1 -- n
  |> map ~f:(fun base -> calc ~base)
  |> max_exn ?lt:None
  |> Printf.printf "%0.10f\n"
;;
