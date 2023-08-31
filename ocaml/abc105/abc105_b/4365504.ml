//##// Contest ID: abc105
//##// Problem ID: abc105_b ( https://atcoder.jp/contests/abc105/tasks/abc105_b )
//##// Title: B. Cakes and Donuts
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 09:09:23 +0000 UTC ( https://atcoder.jp/contests/abc105/submissions/4365504 ) 

let make_no =
  let rec one n f =
    let i = (4 * n) + 1 in
    if i < 21 then i :: one (n + 1) f else f
  in
  let rec two n f =
    let i = (4 * n) + 2 in
    if i < 14 then i :: two (n + 1) f else f
  in
  let rec three n f =
    let i = (4 * n) + 3 in
    if i < 7 then i :: three (n + 1) f else f
  in
  one 0 (two 0 (three 0 []))

let () =
  let n = read_int () in
  let l = make_no in
  (match List.mem n l with true -> "No" | false -> "Yes") |> print_endline
