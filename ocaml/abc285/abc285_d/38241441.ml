//##// Contest ID: abc285
//##// Problem ID: abc285_d ( https://atcoder.jp/contests/abc285/tasks/abc285_d )
//##// Title: D. Change Usernames
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-22 04:23:09 +0000 UTC ( https://atcoder.jp/contests/abc285/submissions/38241441 ) 

let n = read_int ()

open Core
open IterLabels

let st = Array.init n ~f:(fun _ -> Scanf.scanf " %s %s" (fun x y -> (x, y)))
let names = Hashtbl.create (module String)

let () =
  Array.iteri st ~f:(fun i (s, t) -> Hashtbl.add_exn names ~key:s ~data:(i, t))

let _par = Array.init n ~f:(fun _ -> -1)

let rec par i =
  if _par.(i) < 0 then i
  else if _par.(i) = i then i
  else (
    _par.(i) <- par _par.(i);
    _par.(i))

let join i j =
  let i = par i in
  let j = par j in
  _par.(i) <- j

let () =
  Array.iteri st ~f:(fun i (s, t) ->
      match Hashtbl.find names t with Some (j, _) -> join i j | None -> ())

let () =
  print_endline
  @@
  if 0 -- (n - 1) |> for_all ~f:(fun i -> _par.(par i) = -1) then "Yes"
  else "No"
