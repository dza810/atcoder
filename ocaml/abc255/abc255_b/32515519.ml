//##// Contest ID: abc255
//##// Problem ID: abc255_b ( https://atcoder.jp/contests/abc255/tasks/abc255_b )
//##// Title: B. Light It Up
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-17 07:53:15 +0000 UTC ( https://atcoder.jp/contests/abc255/submissions/32515519 ) 

open Core
open Num
  
let id x = x
let inf = Int.max_value
let si _ = Scanf.scanf " %d" id
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let ps s = printf "%s\n" s
let pf f = printf "%0.8f\n" f
let ( -- ) s e = List.init (e - s) ~f:(( + ) s)
let ( >>| ) x f = List.map ~f x
let ( >|| ) x f = List.iter ~f x
let ( >>= ) x f = List.bind ~f x
let fold x init f = List.fold ~f ~init x

module Mod = struct
  let m = 1_000_000_007
  let mm x = ((x mod m) + m) mod m
  let ( +^ ) x y = mm x + mm y |> mm  
  let ( -^ ) x y = mm x - mm y |> mm  
  let ( *^ ) x y = mm x * mm y |> mm  
end

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let i2f = Float.of_int


(* ここから *)
let nn = si ()
let kk = si ()

let flg = (0 -- nn) >>| (fun _ -> false )|> Array.of_list
;;
let () = (0 -- kk) >|| fun _ -> let a = si () in flg.(a-1) <- true
;;
let xy = (0 -- nn) >>| fun _ -> (
  si () , si () 
)
;;

let no = List.filteri xy ~f:(fun i x -> not flg.(i))
let yes = List.filteri xy ~f:(fun i x -> flg.(i))

let d a b =
  let ax, ay = a in
  let bx, by = b in  
  (i2f (ax - bx)) ** 2.  +. (i2f (ay - by)) ** 2. 

let () =
  let rs = no >>| (fun n -> 
    let x = yes >>| fun y -> d n y in
    fold x Float.infinity Float.min
    )
    in
    fold rs 0. Float.max |> Float.sqrt |> pf