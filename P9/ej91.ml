let rec to0from n =
    try List.init (n+1) (function i->n-i)
    with Invalid_argument _ -> [] 
;;

let rec fromto m n =
    try List.init (n-m+1) (function i->m+i)
    with Invalid_argument _ -> [] 
;;  

let rec from1to n =
    try List.init (n) (function i->i+1)
    with Invalid_argument _ -> [] 
;;


let map f l =
    List.rev(List.rev_map f l)
;;


let power x y =
    let rec innerpower x y aux=
        if y = 0 then aux
        else innerpower x (y - 1) (x * aux)
    in
        if y >= 0 then innerpower x y 1
        else invalid_arg "power"
;;

(*---*)
let incseg l =
    List.fold_left (fun x t -> x @ List.map ((+) x) t) [] l
;;

let incseg l =
List.fold_right (fun x t -> x::List.map ((+) x) t) l []
;;

let remove x l= 
    let rec aux l2 = function
        [] -> []
      | h::t -> if x = h then List.rev_append l2 t
                         else aux (h::l2) t
    in aux [] l                   
;;


let divide l = 
    List.partition (function x -> x mod 2 = 0) l
;;

(*---*)
let rec compress = function
    | h1::h2::t -> if h1 = h2 then compress (h2::t)
                    else h1 :: compress (h2::t)
    | l -> l
;;