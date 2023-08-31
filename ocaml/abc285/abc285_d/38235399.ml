//##// Contest ID: abc285
//##// Problem ID: abc285_d ( https://atcoder.jp/contests/abc285/tasks/abc285_d )
//##// Title: D. Change Usernames
//##// Language: OCaml (4.10.0)
//##// Submitted: 2023-01-21 17:51:40 +0000 UTC ( https://atcoder.jp/contests/abc285/submissions/38235399 ) 

module StringSet = Set.Make (String)

let changeUsername n s t =
  let names = Hashtbl.create n in
  let rev_names = Hashtbl.create n in
  let used_names = StringSet.of_list s in
  let new_names = StringSet.of_list t in
  List.iter2
    (fun ss tt ->
      Hashtbl.add names ss tt;
      Hashtbl.add rev_names tt ss)
    s t;

  let rec helper used_names new_names queue =
    match queue with
    | [] -> if StringSet.is_empty new_names then "Yes" else "No"
    | user :: q ->
        let new_name = Hashtbl.find names user in
        let used_names = StringSet.remove user used_names in
        let new_names = StringSet.remove new_name new_names in
        let used_names = StringSet.add new_name used_names in
        if Hashtbl.mem rev_names user then
          helper used_names new_names (Hashtbl.find rev_names user :: q)
        else helper used_names new_names q
  in
  helper used_names new_names
    (List.filter
       (fun ss -> not (StringSet.mem (Hashtbl.find names ss) used_names))
       s)

let n = read_int ()
let st = List.init n (fun _ -> Scanf.scanf " %s %s" (fun s t -> (s, t)))
let s = List.map fst st
let t = List.map snd st
let () = print_endline (changeUsername n s t)
