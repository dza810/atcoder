//##// Contest ID: abc082
//##// Problem ID: abc082_b ( https://atcoder.jp/contests/abc082/tasks/abc082_b )
//##// Title: B. Two Anagrams
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-20 13:17:33 +0000 UTC ( https://atcoder.jp/contests/abc082/submissions/4331977 ) 

let () =
  let s = read_line () in
  let t = read_line () in
  let sort s f =
    let arr = Array.init (String.length s) (fun i -> String.make 1 s.[i]) in
    Array.sort f arr ;
    Array.fold_left (fun x y -> x ^ y) "" arr
  in
  let s = sort s compare in
  let t = sort t (fun x y -> compare y x) in
  (match s < t with true -> "Yes" | false -> "No") |> print_endline
