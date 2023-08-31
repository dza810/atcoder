//##// Contest ID: abc302
//##// Problem ID: abc302_e ( https://atcoder.jp/contests/abc302/tasks/abc302_e )
//##// Title: E. Isolation
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-06 14:21:35 +0000 UTC ( https://atcoder.jp/contests/abc302/submissions/42043893 ) 

open IterLabels
open Core

let n, q = Scanf.scanf " %d %d" Tuple2.create
let arr = Array.init (n + 1) ~f:(fun _ -> Set.empty (module Int))

let query ans =
  let ans =
    match Scanf.scanf " %d" Fn.id with
    | 1 ->
        let u, v = Scanf.scanf " %d %d" Tuple2.create in
        let ans = ans + if Set.is_empty arr.(u) then -1 else 0 in
        let ans = ans + if Set.is_empty arr.(v) then -1 else 0 in
        arr.(u) <- Set.add arr.(u) v;
        arr.(v) <- Set.add arr.(v) u;
        ans
    | 2 ->
        let v = Scanf.scanf " %d" Fn.id in
        let ans = ans + if Set.is_empty arr.(v) then 0 else 1 in
        let ans =
          Set.fold ~init:ans arr.(v) ~f:(fun acc u ->
              arr.(u) <- Set.remove arr.(u) v;
              acc + if Set.is_empty arr.(u) then 1 else 0)
        in
        arr.(v) <- Set.empty (module Int);
        ans
    | _ -> failwith ""
  in
  printf "%d\n" ans;
  ans

let () = 1 -- q |> fold ~init:n ~f:(fun acc _ -> query acc) |> ignore
