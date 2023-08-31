//##// Contest ID: abc286
//##// Problem ID: abc286_e ( https://atcoder.jp/contests/abc286/tasks/abc286_e )
//##// Title: E. Souvenir
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-27 14:42:32 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38358950 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)
let graph = Array.create ~len:n []

let () =
  0 -- (n - 1)
  |> iter ~f:(fun i ->
         0 -- (n - 1)
         |> iter ~f:(fun j ->
                match Scanf.scanf " %c" Fn.id with
                | 'Y' -> graph.(i) <- j :: graph.(i)
                | _ -> ()))

type t = V of int * int | Inf

let add x y =
  match (x, y) with
  | Inf, _ | _, Inf -> Inf
  | V (x, y), V (p, q) -> V (x + p, y + q)

let ( </ ) x y =
  match (x, y) with
  | Inf, _ -> false
  | _, Inf -> true
  | V (x, y), V (a, b) -> if x = a then y > b else x < a

let dist = Array.make_matrix ~dimx:n ~dimy:n Inf

let () =
  graph
  |> Array.iteri ~f:(fun i l ->
         l |> List.iter ~f:(fun j -> dist.(i).(j) <- V (1, a.(j))))

let () = (0 -- (n - 1)) (fun i -> dist.(i).(i) <- V (0, 0))

let () =
  for k = 0 to n - 1 do
    for j = 0 to n - 1 do
      for i = 0 to n - 1 do
        let v = add dist.(i).(k) dist.(k).(j) in
        if v </ dist.(i).(j) then dist.(i).(j) <- v
      done
    done
  done

let q = Scanf.scanf " %d" Fn.id

let () =
  1 -- q
  |> iter ~f:(fun _ ->
         let s, t = Scanf.scanf " %d %d" (fun x y -> (x, y)) in
         let s, t = (s - 1, t - 1) in
         match dist.(s).(t) with
         | Inf -> print_endline "Impossible"
         | V (h, o) ->
             let o = o + a.(s) in
             printf "%d %d\n" h o)
