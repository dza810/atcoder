//##// Contest ID: arc004
//##// Problem ID: arc004_1 ( https://atcoder.jp/contests/arc004/tasks/arc004_1 )
//##// Title: A. 2点間距離の最大値 ( The longest distance )
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 09:49:01 +0000 UTC ( https://atcoder.jp/contests/arc004/submissions/4365840 ) 

let list_init n f =
  let rec aux n f l = if n >= 0 then aux (n - 1) f (f n :: l) else l in
  aux (n - 1) f []

let len li =
  let rec aux li mx =
    match li with
    | [] -> mx
    | (x, y) :: ps ->
        List.map (fun (x', y') -> ((x -. x') ** 2.0) +. ((y -. y') ** 2.0)) ps
        |> List.fold_left max mx |> aux ps
  in
  sqrt @@ aux li 0.0

let () =
  let n = read_int () in
  let f = float_of_int in
  list_init n (fun _ -> Scanf.scanf " %d %d" (fun x y -> (f x, f y)))
  |> len |> Printf.printf "%f\n"
