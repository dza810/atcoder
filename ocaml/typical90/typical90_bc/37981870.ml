//##// Contest ID: typical90
//##// Problem ID: typical90_bc ( https://atcoder.jp/contests/typical90/tasks/typical90_bc )
//##// Title: 055. Select 5（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-13 13:20:25 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/37981870 ) 

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

let nn, pp, qq = si3 ()
let aa = Array.init nn ~f:(fun _ -> si () % pp)

let rec loop i s p =
  if i = 0 then if p % pp = qq then 1 else 0
  else
    s -- (nn - 1) >|= (fun a -> loop (i - 1) (a + 1) (aa.(a) * p % pp)) |> sum

let () = pi @@ loop 5 0 1