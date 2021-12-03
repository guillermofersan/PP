open List;;

let rec to0from n =
    try init (n+1) (function i->n-i)
    with Invalid_argument _ -> [] 
;;

let rec fromto m n =
    try init (n-m+1) (function i->m+i)
    with Invalid_argument _ -> [] 
;;  

let rec from1to n =
    try init (n) (function i->i+1)
    with Invalid_argument _ -> [] 
;;


let map f l =
    rev(rev_map f l)
;;


let power x y =
    let rec innerpower x y aux=
        if y = 0 then aux
        else innerpower x (y - 1) (x * aux)
    in
        if y >= 0 then innerpower x y 1
        else invalid_arg "power"
;;

let incseg l = 
    let rec aux l acc l2 = match l with
        [] -> []
        | [h] -> rev ((h + acc)::l2)
        | h::t -> aux t (h + acc) ((h + acc)::l2)
    in aux l 0 [];;


let remove x l= 
    let rec aux l2 = function
        [] -> []
      | h::t -> if x = h then rev_append l2 t
                         else aux (h::l2) t
    in aux [] l                   
;;


let divide l =
  let rec aux l1 l2 = function
      [] -> (rev l1, rev l2)
    | h::[] -> (rev (h::l1), rev l2)
    | h1::h2::t -> aux (h1::l1) (h2::l2) t
  in aux [] [] l;;

(*---*)
let rec compress = function
    | h1::h2::t -> if h1 = h2 then compress (h2::t)
                    else h1 :: compress (h2::t)
    | l -> l
;;