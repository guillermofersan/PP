open List;;

let rec divide l = match l with
    h1::h2::t -> let t1, t2 = divide t 
                 in (h1::t1, h2::t2)
  | _ -> l, []
;;

let rec merge ord = function
    [], l | l, [] -> l
  | h1::t1, h2::t2 -> if ord h1 h2 then h1 :: merge ord (t1, h2::t2)
                      else h2 :: merge ord (h1::t1, t2)
;;

let rec msort1 ord l = match l with
    [] | _::[] -> l
  | _ -> let l1, l2 = divide l in
         merge ord (msort1 ord l1, msort1 ord l2)
;;

(*La no terminalidad de divide y merge puede causar
problemas (stack overflow) al intentar utilizarlas con listas de gran tamaño
como puede ser la siguiente:
*)
let bigl = init 500000 (function x -> Random.int 2500);;


let divide' l =
  let rec aux l1 l2 = function
      [] -> (rev l1, rev l2)
    | h::[] -> (rev (h::l1), rev l2)
    | h1::h2::t -> aux (h1::l1) (h2::l2) t
  in aux [] [] l;;

let merge' ord (l1, l2) =
  let rec aux laux = function
    [], l | l, [] -> rev_append laux l
    | h1::t1, h2::t2 -> if ord h1 h2 then aux (h1::laux) (t1, h2::t2) 
                        else aux (h2::laux) (h1::t1, t2) 
  in aux [] (l1, l2)
;;

let rec msort2 ord l = match l with
    [] | _::[] -> l
  | _ -> let l1, l2 = divide' l in
         merge' ord (msort2 ord l1, msort2 ord l2)
;;


(*
msort2 es mas lento  que msort1, concretamente un 121% mas lento 
msort2 es mas rapido que qsort2, concretamente un 282% mas rapido
*)