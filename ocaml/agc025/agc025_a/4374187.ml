//##// Contest ID: agc025
//##// Problem ID: agc025_a ( https://atcoder.jp/contests/agc025/tasks/agc025_a )
//##// Title: A. Digits Sum
//##// Language: OCaml (4.02.3)
//##// Submitted: 2019-02-24 12:48:55 +0000 UTC ( https://atcoder.jp/contests/agc025/submissions/4374187 ) 

let list_init n f =
  let rec aux i f l = if i < n then aux (i + 1) f (f i :: l) else l in
  aux 0 f []

let sumd x =
  let rec aux x s = if x < 10 then s + x else aux (x / 10) (s + (x mod 10)) in
  aux x 0

let calc i =
  list_init (i - 1) (fun x -> sumd (x + 1) + sumd (i - x - 1))
  |> List.fold_left min 9999999999

let () = Scanf.scanf "%d" calc |> Printf.printf "%d\n"
