//##// Contest ID: abc276
//##// Problem ID: abc276_e ( https://atcoder.jp/contests/abc276/tasks/abc276_e )
//##// Title: E. Round Trip
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-04 10:11:49 +0000 UTC ( https://atcoder.jp/contests/abc276/submissions/38591904 ) 

open Core
open IterLabels

let h, w = Scanf.scanf " %d %d" Tuple2.create
let s = ref (-1, -1)
let cc = Array.init h ~f:(fun i -> Array.init w ~f:(fun j -> Scanf.scanf " %c" Fn.id))
let _par = Hashtbl.create (module Int)

let par (i, j) =
  let p = (i * w) + j in
  let rec par p =
    let v =
      match Hashtbl.find _par p with
      | None -> p
      | Some v when Poly.(v = p) -> p
      | Some v -> par v
    in
    Hashtbl.set _par ~key:p ~data:v;
    v
  in
  par p
;;

let union p q =
  let p = par p in
  let q = par q in
  let p, q = Poly.(min p q, max p q) in
  Hashtbl.set _par ~key:p ~data:q
;;

let join (i, j) =
  [ 0, 1; 0, -1; 1, 0; -1, 0 ]
  |> List.iter ~f:(fun (dh, dw) ->
       let ii, jj = i + dh, j + dw in
       if 0 <= ii && ii < h && 0 <= jj && jj < w && Char.(cc.(ii).(jj) = '.')
       then union (i, j) (ii, jj))
;;

let () =
  (0 -- (h - 1)) (fun i ->
    (0 -- (w - 1)) (fun j ->
      match cc.(i).(j) with
      | 'S' -> s := i, j
      | '.' -> join (i, j)
      | _ -> ()))
;;

let didj = [| 0, 1; 0, -1; 1, 0; -1, 0 |]

let () =
  let v =
    0 -- 3
    |> map ~f:(fun i ->
         let di, dj = didj.(i) in
         let a = fst !s + di, snd !s + dj in
         i + 1 -- 3
         |> map ~f:(fun j ->
              let di, dj = didj.(j) in
              let b = fst !s + di, snd !s + dj in
              Poly.(par a = par b)))
    |> concat
    |> find_pred ~f:Fn.id
    |> Option.value ~default:false
  in
  Printf.printf "%s\n" @@ if v then "Yes" else "No"
;;
