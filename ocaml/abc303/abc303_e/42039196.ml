//##// Contest ID: abc303
//##// Problem ID: abc303_e ( https://atcoder.jp/contests/abc303/tasks/abc303_e )
//##// Title: E. A Gift From the Stars
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-06-06 10:38:32 +0000 UTC ( https://atcoder.jp/contests/abc303/submissions/42039196 ) 

open Core
open IterLabels

let n = Scanf.scanf " %d" Fn.id
let graph = Hashtbl.create (module Int)

let () =
  (1 -- (n - 1)) (fun _ ->
      let u, v = Scanf.scanf " %d %d" Tuple2.create in
      let u, v = (u - 1, v - 1) in
      Hashtbl.add_multi graph ~key:u ~data:v;
      Hashtbl.add_multi graph ~key:v ~data:u)

let leaf =
  Hashtbl.fold graph ~init:None ~f:(fun ~key ~data acc ->
      match (acc, data) with
      | None, [ _ ] -> Some key
      | None, _ -> None
      | Some _, _ -> acc)

let dijistra i =
  let dist = Array.create ~len:n (2 lsl 60) in
  let q = Queue.create () in
  dist.(i) <- 0;
  Queue.enqueue q i;
  let rec loop () =
    match Queue.dequeue q with
    | None -> dist
    | Some x ->
        Hashtbl.find_multi graph x
        |> List.iter ~f:(fun y ->
               if dist.(y) > dist.(x) + 1 then (
                 dist.(y) <- dist.(x) + 1;
                 Queue.enqueue q y));
        loop ()
  in
  loop ()

let dist = dijistra @@ List.nth_exn (Hashtbl.find_exn graph (Option.value_exn leaf)) 0

let () =
  dist
  |> Array.filter_mapi ~f:(fun i x -> if x % 3 = 0 then Some i else None)
  |> Array.map ~f:(fun x -> Hashtbl.find_multi graph x |> List.length)
  |> Array.sorted_copy ~compare:Int.compare
  |> Array.iter ~f:(fun x -> printf "%d " x)

let () = printf "\n"
