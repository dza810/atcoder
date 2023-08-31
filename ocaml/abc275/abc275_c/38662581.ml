//##// Contest ID: abc275
//##// Problem ID: abc275_c ( https://atcoder.jp/contests/abc275/tasks/abc275_c )
//##// Title: C. Counting Squares
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-06 05:12:16 +0000 UTC ( https://atcoder.jp/contests/abc275/submissions/38662581 ) 

open IterLabels
open Core
module PSet = Core.Set.Poly

let s = Array.init 9 ~f:(fun _ -> Array.init 9 ~f:(fun _ -> Scanf.scanf " %c" Fn.id))

let () =
  let set = ref @@ PSet.empty in
  let len p1 p2 =
    (((p1 / 9) - (p2 / 9)) * ((p1 / 9) - (p2 / 9)))
    + (((p1 % 9) - (p2 % 9)) * ((p1 % 9) - (p2 % 9)))
  in
  for p1 = 0 to 80 do
    if Char.(s.(p1 / 9).(p1 % 9) = '#')
    then
      for p2 = p1 + 1 to 80 do
        if Char.(s.(p2 / 9).(p2 % 9) = '#')
        then
          for p3 = p2 + 1 to 80 do
            if p3 <> p1 && p3 <> p2 && Char.(s.(p3 / 9).(p3 % 9) = '#')
            then
              for p4 = p3 + 1 to 80 do
                if p4 <> p1 && p4 <> p2 && p4 <> p3 && Char.(s.(p4 / 9).(p4 % 9) = '#')
                then (
                  let ps = [| p1; p2; p3; p4 |] in
                  let () = Array.sort ~compare:Int.compare ps in
                  let l =
                    0 -- 2
                    |> flat_map ~f:(fun i ->
                         i + 1 -- 3 |> map ~f:(fun j -> len ps.(i) ps.(j)))
                    |> sort
                    |> to_array
                  in
                  let b1 = l.(0) = l.(1) && l.(1) = l.(2) && l.(2) = l.(3) in
                  let b2 = l.(4) = l.(5) in
                  let b3 = 2 * l.(0) = l.(4) in
                  if b1 && b2 && b3
                  then set := PSet.add !set (ps.(0), ps.(1), ps.(2), ps.(3)))
              done
          done
      done
  done;
  Printf.printf "%d\n" @@ PSet.length !set
;;
