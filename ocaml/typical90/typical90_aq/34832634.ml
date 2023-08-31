//##// Contest ID: typical90
//##// Problem ID: typical90_aq ( https://atcoder.jp/contests/typical90/tasks/typical90_aq )
//##// Title: 043. Maze Challenge with Lack of Sleep（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-13 07:32:16 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34832634 ) 

open Core
open Printf
open Num
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d \n" x else printf "%d " x;
        acc - 1)
  in
  ()
;;

let cache tbl key ~f =
  match Stdlib.Hashtbl.find_opt tbl key with
  | Some x -> x
  | None ->
    let x = f () in
    Stdlib.Hashtbl.add tbl key x;
    x
;;

let i2f x = Int.to_float x

module Stack = struct
  type 'a t =
    | Stack of (unit -> 'a * 'a t)
    | Empty

  let empty = Empty
  let push t v = Stack (fun () -> v, t)

  let pop t =
    match t with
    | Stack t -> Some (t ())
    | Empty -> None
  ;;

  let peek t =
    match t with
    | Stack tt ->
      let v, _ = tt () in
      Some (v, t)
    | Empty -> None
  ;;
end

module Queue = struct
  type 'a stack = 'a Stack.t

  type 'a t =
    { front : 'a stack
    ; back : 'a stack
    }

  let empty = { front = Stack.empty; back = Stack.empty }

  let push_back t v =
    let back = Stack.push t.back v in
    { t with back }
  ;;

  let push_front t v =
    let front = Stack.push t.front v in
    { t with front }
  ;;

  let rec _move_b_to_f t =
    match Stack.pop t.back with
    | None -> t
    | Some (v, back) ->
      let front = Stack.push t.front v in
      let t = { front; back } in
      _move_b_to_f t
  ;;

  let dequeue t =
    let t =
      match Stack.peek t.front with
      | None -> _move_b_to_f t
      | _ -> t
    in
    match Stack.pop t.front with
    | None -> None
    | Some (v, front) -> Some (v, { t with front })
  ;;
end

(************)
let hh, ww = si2 ()
let rs, cs = si2 ()
let rt, ct = si2 ()
let gg = Array.make_matrix ~dimx:(hh + 2) ~dimy:(ww + 2) '#'
let () = 1 -- hh |> iter ~f:(fun h -> 1 -- ww |> iter ~f:(fun w -> gg.(h).(w) <- sc ()))
let dr = [| 1; 0; -1; 0 |]
let dc = [| 0; 1; 0; -1 |]

let dijstra (r, c) =
  (* let q = Heap.init ~lt:Poly.( < ) 2_000_000 in *)
  let q = Queue.empty in
  let cost =
    Array.init (hh + 2) ~f:(fun _ ->
        Array.init (ww + 2) ~f:(fun _ -> Array.init 4 ~f:(fun _ -> Int.max_value - 100)))
  in
  let q =
    0 -- 3
    |> fold ~init:q ~f:(fun q i ->
           cost.(r).(c).(i) <- 0;
           (* Heap.add q (r, c, i) *)
           Queue.push_back q (r, c, i))
  in
  let rec aux q =
    (* match Heap.pop q with *)
    match Queue.dequeue q with
    | None -> ()
    | Some ((r, c, dir), q) ->
      if Char.(gg.(r).(c) = '.')
      then (
        let q =
          0 -- 3
          |> fold ~init:q ~f:(fun q i ->
                 let new_v = cost.(r).(c).(dir) + if dir = i then 0 else 1 in
                 let old_v = cost.(r + dr.(i)).(c + dc.(i)).(i) in
                 if Char.(gg.(r + dr.(i)).(c + dc.(i)) = '.') && old_v > new_v
                 then (
                   cost.(r + dr.(i)).(c + dc.(i)).(i) <- new_v;
                   (* Heap.add q (r + dr.(i), c + dc.(i), i)) *)
                   if dir <> i
                   then Queue.push_back q (r + dr.(i), c + dc.(i), i)
                   else Queue.push_front q (r + dr.(i), c + dc.(i), i))
                 else q)
        in
        aux q)
  in
  aux q;
  cost
;;

let cost = dijstra (rs, cs)
let () = 0 -- 3 >|= (fun i -> cost.(rt).(ct).(i)) |> min_exn ?lt:None |> pi
