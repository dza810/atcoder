//##// Contest ID: abc286
//##// Problem ID: abc286_d ( https://atcoder.jp/contests/abc286/tasks/abc286_d )
//##// Title: D. Money in Hand
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-05 02:56:37 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38635456 ) 

open Core
open IterLabels

let n, x = Scanf.scanf " %d %d" Tuple2.create
let ab = Array.init n ~f:(fun _ -> Scanf.scanf " %d %d" Tuple2.create)
let dptbl = Array.make_matrix ~dimx:(n + 1) ~dimy:(x + 1) false
let () = dptbl.(0).(0) <- true

let () =
  for i = 1 to n do
    let a, b = ab.(i - 1) in
    dptbl.(i).(0) <- true;
    for bb = 1 to b do
      for x = 0 to x do
        dptbl.(i).(x) <- dptbl.(i).(x) || dptbl.(i - 1).(x);
        let xx = x - (a * bb) in
        if xx >= 0 then dptbl.(i).(x) <- dptbl.(i).(x) || dptbl.(i - 1).(xx)
      done
    done
  done;
  Printf.printf "%s\n" @@ if dptbl.(n).(x) then "Yes" else "No"
;;
