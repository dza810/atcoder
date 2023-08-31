//##// Contest ID: dp
//##// Problem ID: dp_h ( https://atcoder.jp/contests/dp/tasks/dp_h )
//##// Title: H. Grid 1
//##// Language: OCaml (4.10.0)
//##// Submitted: 2021-06-07 12:18:00 +0000 UTC ( https://atcoder.jp/contests/dp/submissions/23277713 ) 

open Core

let int_inf = Int.max_value
let id x = x

let repeat ~f =
  let rec loop acc = function
    | 0 -> List.rev acc
    | n -> loop (f () :: acc) (n - 1)
  in
  loop
;;

let get_int () = Scanf.scanf "%d " id
let h = get_int ()
let w = get_int ()

let dp =
  Array.init h ~f:(fun _ ->
      Array.init (w + 1) ~f:(fun _ ->
          Scanf.scanf "%c" (fun x -> if Char.(x = '.') then Some 0 else None)))
;;

let do_mod x = x mod 1000000007

let () =
  for i = 0 to h - 1 do
    for j = 0 to w - 1 do
      if i = 0 && j = 0
      then dp.(i).(j) <- Some 1
      else (
        match dp.(i).(j) with
        | None -> ()
        | Some _ ->
          let u = if i > 0 then dp.(i - 1).(j) else None in
          let l = if j > 0 then dp.(i).(j - 1) else None in
          (match u, l with
          | Some x, Some y -> dp.(i).(j) <- Some (x + y |> do_mod)
          | None, Some y -> dp.(i).(j) <- Some (y |> do_mod)
          | Some x, None -> dp.(i).(j) <- Some (x |> do_mod)
          | None, None -> dp.(i).(j) <- None))
    done
  done
;;

let ans = dp.(h - 1).(w - 1) |> Option.value ~default:0 |> do_mod |> Int.to_string
let () = ans |> print_endline
