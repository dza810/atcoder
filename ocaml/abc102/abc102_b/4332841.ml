//##// Contest ID: abc102
//##// Problem ID: abc102_b ( https://atcoder.jp/contests/abc102/tasks/abc102_b )
//##// Title: B. Maximum Difference
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 14:31:48 +0000 UTC ( https://atcoder.jp/contests/abc102/submissions/4332841 ) 

let calc (l, s) = function
  | x when x > l && x < s -> (x, x)
  | x when x > l -> (x, s)
  | x when x < s -> (l, x)
  | _ -> (l, s)

let () =
  let n = read_int () in
  let li = Array.init n (fun _ -> Scanf.scanf " %d" (fun x -> x)) in
  (* let () = Array.iter (Printf.printf "%d ") li in *)
  let l, s = Array.fold_left calc (1, 1000000000) li in
  print_int (l - s) ;
  print_newline ()
