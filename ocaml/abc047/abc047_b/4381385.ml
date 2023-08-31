//##// Contest ID: abc047
//##// Problem ID: abc047_b ( https://atcoder.jp/contests/abc047/tasks/abc047_b )
//##// Title: B. Snuke's Coloring 2 (ABC Edit)
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-25 02:00:18 +0000 UTC ( https://atcoder.jp/contests/abc047/submissions/4381385 ) 

open Batteries

let () =
  let w, h, n = Scanf.scanf " %d %d %d " (fun w h n -> (w, h, n)) in
  let arr = Array.make_matrix w h 1 in
  let filter_arr f =
    1 -- w
    |> Enum.iter (fun x ->
           1 -- h |> Enum.iter (fun y -> if f x y then arr.(x - 1).(y - 1) <- 0)
       )
  in
  1 -- n
  |> Enum.iter (fun _ ->
         Scanf.scanf " %d %d %d" (fun xi yi ai ->
             match ai with
             | 1 -> filter_arr (fun x _ -> x <= xi)
             | 2 -> filter_arr (fun x _ -> x > xi)
             | 3 -> filter_arr (fun _ y -> y <= yi)
             | 4 -> filter_arr (fun _ y -> y > yi)
             | _ -> failwith "" ) ) ;
  Array.map (Array.fold_left ( + ) 0) arr
  |> Array.fold_left ( + ) 0 |> Printf.printf "%d\n"
