//##// Contest ID: abc311
//##// Problem ID: abc311_d ( https://atcoder.jp/contests/abc311/tasks/abc311_d )
//##// Title: D. Grid Ice Floor
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-07-24 07:18:53 +0000 UTC ( https://atcoder.jp/contests/abc311/submissions/43925077 ) 

open IterLabels
open Core

let n, m = Scanf.scanf " %d %d" Tuple2.create

module Int2 = struct
  type t = int * int

  include Tuple.Comparable (Int) (Int)
  include Tuple.Hashable (Int) (Int)
end

let is_ice =
  Array.init n ~f:(fun _ ->
      Array.init m ~f:(fun _ -> Char.('.' = Scanf.scanf " %c" Fn.id)))

let dp =
  Array.init n ~f:(fun i -> Array.init m ~f:(fun j -> Set.empty (module Int2)))

let calced = Array.init n ~f:(fun i -> Array.init m ~f:(fun j -> false))
let touched = Array.init n ~f:(fun i -> Array.init m ~f:(fun j -> false))
let () = touched.(1).(1) <- true
let di = [| 1; 0; -1; 0 |]
let dj = [| 0; 1; 0; -1 |]

let rec dfs i j =
  let () = calced.(i).(j) <- true in
  0 -- 3
  |> iter ~f:(fun d ->
         let rec calc i j =
           if is_ice.(i + di.(d)).(j + dj.(d)) then
            let () = touched.(i + di.(d)).(j + dj.(d)) <- true in
             calc (i + di.(d)) (j + dj.(d))
           else (i, j)
         in
         let ii, jj = calc i j in
         if not @@ calced.(ii).(jj) then dfs ii jj)

let () = dfs 1 1

let () =
  touched |> of_array
  |> map ~f:(fun a -> a |> of_array |> filter_count ~f:Fn.id)
  |> sum |> Printf.printf "%d\n"
