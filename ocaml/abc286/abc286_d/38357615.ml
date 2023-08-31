//##// Contest ID: abc286
//##// Problem ID: abc286_d ( https://atcoder.jp/contests/abc286/tasks/abc286_d )
//##// Title: D. Money in Hand
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-27 13:27:45 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38357615 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let x = Scanf.scanf " %d" Fn.id
let ab = Array.init n ~f:(fun _ -> Scanf.scanf " %d %d" (fun x y -> (x, y)))
let () = Array.sort ~compare:Poly.compare ab
let dptbl = Array.create ~len:(x + 1) false
let () = dptbl.(0) <- true

let () =
  0 -- (n - 1)
  |> iter ~f:(fun nn ->
         let a, b = ab.(nn) in
         x --^ 1
         |> iter ~f:(fun xx ->
                match
                1 -- b
                  |> find_pred ~f:(fun bb ->
                         xx - (a * bb) >= 0 && dptbl.(xx - (a * bb)))
                with
                | Some _ -> dptbl.(xx) <- true
                | None -> ()))

let () = print_endline @@ if dptbl.(x) then "Yes" else "No"
