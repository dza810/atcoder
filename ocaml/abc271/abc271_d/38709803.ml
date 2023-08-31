//##// Contest ID: abc271
//##// Problem ID: abc271_d ( https://atcoder.jp/contests/abc271/tasks/abc271_d )
//##// Title: D. Flip and Adjust
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-02-08 06:48:46 +0000 UTC ( https://atcoder.jp/contests/abc271/submissions/38709803 ) 

open Core
open IterLabels
module Set = Core.Set.Poly

let n, s = Scanf.scanf " %d %d" Tuple2.create
let path = Array.make_matrix ~dimx:1010 ~dimy:10100 None

let () =
  let init = Set.singleton 0 in
  let set =
    1 -- n
    |> fold ~init ~f:(fun set i ->
         let a, b = Scanf.scanf " %d %d" Tuple2.create in
         let aa =
           Set.map set ~f:(fun v ->
             let nv = v + a in
             path.(i).(nv) <- Some ('H', v);
             nv)
         in
         let bb =
           Set.map set ~f:(fun v ->
             let nv = v + b in
             path.(i).(nv) <- Some ('T', v);
             nv)
         in
         Set.union aa bb)
  in
  if not @@ Set.mem set s
  then Printf.printf "No\n"
  else (
    let rec find_path out i v =
      if v = 0 && i = 0
      then Printf.printf "%s\n" (String.of_char_list out)
      else (
        match path.(i).(v) with
        | Some (c, v) -> find_path (c :: out) (i - 1) v
        | None -> failwith "")
    in
    printf "Yes\n";
    find_path [] n s)
;;
