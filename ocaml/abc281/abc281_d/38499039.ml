//##// Contest ID: abc281
//##// Problem ID: abc281_d ( https://atcoder.jp/contests/abc281/tasks/abc281_d )
//##// Title: D. Max Multiple
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-31 05:54:02 +0000 UTC ( https://atcoder.jp/contests/abc281/submissions/38499039 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let k = Scanf.scanf " %d" Fn.id
let d = Scanf.scanf " %d" Fn.id
let a = Array.init n ~f:(fun _ -> Scanf.scanf " %d" Fn.id)

let dptbl =
  Array.init (n + 1) ~f:(fun _ ->
    Array.init (k + 1) ~f:(fun _ -> Array.init d ~f:(const (-1))))
;;

let () = dptbl.(0).(0).(0) <- 0

let () =
  for i = 0 to n - 1 do
    for dd = 0 to d - 1 do
      for kk = 0 to k do
        if dptbl.(i).(kk).(dd) = -1
        then ()
        else (
          dptbl.(i + 1).(kk).(dd) <- Int.max dptbl.(i + 1).(kk).(dd) dptbl.(i).(kk).(dd);
          if kk < k
          then
            dptbl.(i + 1).(kk + 1).((dd + a.(i)) % d)
              <- Int.max dptbl.(i + 1).(kk + 1).((dd + a.(i)) % d)
                 @@ (dptbl.(i).(kk).(dd) + a.(i)))
      done
    done
  done
;;

let () =
  let v = dptbl.(n).(k).(0) in
  Printf.printf "%d\n" @@ if v < 0 then -1 else v
;;
