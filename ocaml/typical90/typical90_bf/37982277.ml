//##// Contest ID: typical90
//##// Problem ID: typical90_bf ( https://atcoder.jp/contests/typical90/tasks/typical90_bf )
//##// Title: 058. Original Calculator（★4）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-13 13:36:20 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37982277 ) 

open Printf
open Core

module M = struct
  open Scanf

  module Int = struct
    let sqrt x = Int.of_float @@ Float.sqrt @@ Float.of_int x

    include Int
  end

  let id = Fn.id
  let si _ = scanf " %d" id
  let sc _ = scanf " %c" id
  let ss _ = scanf " %s" id
  let si2 _ = scanf " %d %d" (fun x y -> (x, y))
  let si3 _ = scanf " %d %d %d" (fun x y z -> (x, y, z))
  let pi x = printf "%d\n" x
  let pf x = printf "%0.10f\n" x
  let ps x = printf "%s\n" x
end

open M

(* open IterLabels.Infix *)
open IterLabels

(************)

let nn, kk = si2 ()
let rec ds x = if x = 0 then 0 else (x % 10) + ds (x / 10)

let rec calc li i x =
  if x = 0 then 0 else
  match List.Assoc.find li ~equal:Int.equal x with
  | Some j -> calc [] (j % (j - i)) x
  | None ->
      let li = (x, i) :: li in
      if i = 0 then x
      else
        let y = ds x in
        let z = (x + y) % 100_000 in
        calc li (i - 1) z

let () = pi @@ calc [] kk nn