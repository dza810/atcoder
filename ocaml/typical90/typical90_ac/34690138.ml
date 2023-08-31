//##// Contest ID: typical90
//##// Problem ID: typical90_ac ( https://atcoder.jp/contests/typical90/tasks/typical90_ac )
//##// Title: 029. Long Bricks（★5）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-09-08 09:55:22 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/34690138 ) 

open Core
open Printf
open Num
open IterLabels

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let pi3 a b c = printf "%d %d %d\n" a b c
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

let pl l =
  let (_ : int) =
    List.fold l ~init:(List.length l) ~f:(fun acc x ->
        if acc = 1 then printf "%d \n" x else printf "%d " x;
        acc - 1)
  in
  ()
;;

let cache tbl key ~f =
  match Stdlib.Hashtbl.find_opt tbl key with
  | Some x -> x
  | None ->
    let x = f () in
    Stdlib.Hashtbl.add tbl key x;
    x
;;

let i2f x = Int.to_float x

(************)


module LazySegTree : sig
  type ('x, 'm) t =
    { n : int
    ; len : int
    ; data : 'x array
    ; lazy_data : 'm array
    ; ex : 'x
    ; em : 'm
    ; fx : 'x -> 'x -> 'x
    ; fa : 'x -> 'm -> 'x
    ; fm : 'm -> 'm -> 'm
    }

  val init
    :  fx:('x -> 'x -> 'x)
    -> fa:('x -> 'm -> 'x)
    -> fm:('m -> 'm -> 'm)
    -> ex:'x
    -> em:'m
    -> int
    -> ('x, 'm) t

  val set : ('x, 'm) t -> int -> 'x -> unit
  val build : ('x, 'm) t -> unit

  (* val _eval : ('x, 'm) t -> int -> unit *)
  val get : ('x, 'm) t -> int -> int -> 'x
  val update : ('x, 'm) t -> int -> int -> 'm -> unit
  val print_segtree_data : (int, 'x) t -> unit
end = struct
  type ('x, 'm) t =
    { n : int
    ; len : int
    ; data : 'x array
    ; lazy_data : 'm array
    ; ex : 'x (* identity element *)
    ; em : 'm (* identity element *)
    ; fx : 'x -> 'x -> 'x
    ; fa : 'x -> 'm -> 'x
    ; fm : 'm -> 'm -> 'm
    }

  let init ~fx ~fa ~fm ~ex ~em n =
    let n = 1 lsl Int.ceil_log2 n in
    let len = 2 * n in
    let data = Array.create ~len ex in
    let lazy_data = Array.create ~len em in
    { n; len; data; lazy_data; ex; em; fx; fa; fm }
  ;;

  let set tree i v = tree.data.(i + tree.n) <- v

  let build tree =
    (* use after set *)
    tree.n - 1 --^ 1
    |> iter ~f:(fun i ->
           tree.data.(i) <- tree.fx tree.data.(2 * i) tree.data.((2 * i) + 1))
  ;;

  let _eval tree i =
    if Poly.(tree.lazy_data.(i) <> tree.em)
    then (
      if i < tree.n
      then (
        (* propagete to down *)
        tree.lazy_data.(i * 2) <- tree.fm tree.lazy_data.(i * 2) tree.lazy_data.(i);
        tree.lazy_data.((i * 2) + 1)
          <- tree.fm tree.lazy_data.((i * 2) + 1) tree.lazy_data.(i));
      tree.data.(i) <- tree.fa tree.data.(i) tree.lazy_data.(i);
      tree.lazy_data.(i) <- tree.em)
  ;;

  (* recursive *)
  let get tree p q =
    (* [p, q) *)
    let rec aux i l r =
      _eval tree i;
      (* [l, r) *)
      (* in range *)
      if r <= p || q <= l
      then tree.ex
      else if p <= l && r <= q
      then tree.data.(i)
      else (
        let c = (l + r) / 2 in
        let vl = aux (i * 2) l c in
        let vr = aux ((i * 2) + 1) c r in
        tree.fx vl vr)
    in
    aux 1 0 tree.n
  ;;

  let update tree p q v =
    (* [p, q) *)
    assert (p <= q);
    let rec aux i l r =
      _eval tree i;
      (* [l, r) *)
      if p <= l && r <= q
      then (
        tree.lazy_data.(i) <- tree.fm tree.lazy_data.(i) v;
        _eval tree i)
      else if p < r && l < q
      then (
        let c = (l + r) / 2 in
        aux (i * 2) l c;
        aux ((i * 2) + 1) c r;
        tree.data.(i) <- tree.fx tree.data.(i * 2) tree.data.((i * 2) + 1))
    in
    aux 1 0 tree.n
  ;;

  let print_segtree_data tr =
    let rec aux l r i =
      if i = 0
      then ()
      else if l <= i && i <= r
      then (
        printf "%d " tr.data.(i);
        aux l r (i + 1))
      else (
        printf "\n";
        aux (l / 2) (r / 2) (l / 2))
    in
    aux tr.n (tr.len - 1) tr.n
  ;;
end

let lazysegtree_max_init n =
  let fx = Int.max in
  LazySegTree.init
    ~ex:0
    ~em:None
    ~fx
    ~fa:(fun x m ->
      match m with
      | None -> x
      | Some m -> fx m x)
    ~fm:(fun m1 m2 ->
      match m1, m2 with
      | Some m1, Some m2 -> Some (fx m1 m2)
      | m1, None -> m1
      | None, m2 -> m2)
    n
;;

let ww, nn = si2 ()
let lr = 1 -- nn >|= si2 |> persistent
let rank = Hashtbl.create (module Int)

let len =
  lr
  >>= (fun (l, r) -> doubleton l r)
  |> sort_uniq ?cmp:None
  |> mapi ~f:(fun i v -> Hashtbl.add_exn rank ~key:v ~data:i)
  |> length
;;

let lr =
  lr
  >|= (fun (l, r) ->
        let l = Hashtbl.find_exn rank l in
        let r = Hashtbl.find_exn rank r in
        l, r)
  |> persistent
;;

let tree = lazysegtree_max_init (len + 1)

let () =
  lr
  |> iter ~f:(fun (l, r) ->
         let h = LazySegTree.get tree l (r + 1) in
         pi (h + 1);
         LazySegTree.update tree l (r + 1) (Some (h + 1)))
;;
