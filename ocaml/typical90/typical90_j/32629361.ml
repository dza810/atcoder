//##// Contest ID: typical90
//##// Problem ID: typical90_j ( https://atcoder.jp/contests/typical90/tasks/typical90_j )
//##// Title: 010. Score Sum Queries（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-20 14:57:47 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32629361 ) 

    open Core
     
    (* open Num *)
    (* open IterLabels *)
     
    let id x = x
    let si _ = Scanf.scanf " %d" id
     
    (* let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y) *)
    let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
    let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
    let sc _ = Scanf.scanf " %c" id
    let ss _ = Scanf.scanf " %s" id
    let pi d = printf "%d\n" d
    let ps s = printf "%s\n" s
    let pf f = printf "%0.6f\n" f
     
    open List
     
    let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)
     
    let option_exn = function
      | Some x -> x
      | None -> assert false
    ;;
     
    let option_either l ~f =
      List.fold l ~init:None ~f:(fun acc x ->
          match acc with
          | None -> f x
          | Some x -> Some x)
    ;;
     
    (************)
     
    let nn = si ()
    let cp = 1 -- nn >>| si2
    let qq = si ()
    let lr = 1 -- qq >>| si2
     
    let ccp =
      cp
      |> fold_map
           ~f:(fun (acca, accb) (c, p) ->
             let acca = acca + if c = 1 then p else 0 in
             let accb = accb + if c = 2 then p else 0 in
             let x = acca, accb in
             x, x)
           ~init:(0, 0)
      |> snd
      |> to_array
    ;;
     
    let () =
      lr
      |> iter ~f:(fun (l, r) ->
             let r1, r2 = ccp.(r - 1) in
             let l1, l2 = if l >= 2 then ccp.(l - 2) else 0, 0 in
             printf "%d %d\n" (r1 - l1) (r2 - l2))
    ;;