//##// Contest ID: typical90
//##// Problem ID: typical90_ak ( https://atcoder.jp/contests/typical90/tasks/typical90_ak )
//##// Title: 037. Don't Leave the Spice（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-11 06:38:57 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38771681 ) 

open Core
open IterLabels


module SegTree = struct
  type t =
    { len : int
    ; f : int -> int -> int
    ; arr : int array
    ; e : int
    }

  let create ~e ~len ~f =
    let len = 2 lsl Int.floor_log2 (len - 1) in
    let arr = Array.init (2 * len) ~f:(const e) in
    { len; arr; f; e }
  ;;

  let set t i v =
    let i = i + t.len - 1 in
    t.arr.(i) <- v;
    let rec aux i =
      let i = (i - 1) / 2 in
      let () = t.arr.(i) <- t.f t.arr.((i * 2) + 1) t.arr.((i * 2) + 2) in
      if i > 0 then aux i
    in
    aux i
  ;;

  let get t l r =
    let rec aux i ll rr =
      if rr <= l || r <= ll
      then t.e
      else if l <= ll && rr <= r
      then t.arr.(i)
      else (
        let cc = ((rr - ll) / 2) + ll in
        let vl = aux ((i * 2) + 1) ll cc in
        let vr = aux ((i * 2) + 2) cc rr in
        t.f vl vr)
    in
    aux 0 0 t.len
  ;;
end

let w, n = Scanf.scanf " %d %d" Tuple2.create
let lrv = Array.init n ~f:(fun _ -> Scanf.scanf " %d %d %d" Tuple3.create)

let rangemax =
  Array.init (n+1) ~f:(fun _ -> SegTree.create ~e:(-(1 lsl 60)) ~len:(w + 2) ~f:Int.max)
;;
let dptbl = Array.make_matrix ~dimx:(n+1) ~dimy:(w + 2) (-(1 lsl 60))
let () = dptbl.(0).(0) <- 0
let () = SegTree.set rangemax.(0) 0 0

let () =
  for i = 1 to n do
    let l, r, v = lrv.(i - 1) in
    for j = 0 to w do
      dptbl.(i).(j) <- dptbl.(i - 1).(j)
    done;
    for j = 0 to w do
      let cl, cr = Int.max 0 (j - r), Int.max 0 (j - l + 1) in
      if cl <> cr
      then (
        let value = SegTree.get rangemax.(i - 1) cl cr in
        if value <> -(1 lsl 60) then dptbl.(i).(j) <- Int.max dptbl.(i).(j) (value + v))
    done;
    for j = 0 to w do
      SegTree.set rangemax.(i) j dptbl.(i).(j)
    done
  done
;;

let () = Printf.printf "%d\n" @@ if dptbl.(n).(w) = -(1 lsl 60) then -1 else dptbl.(n).(w)
