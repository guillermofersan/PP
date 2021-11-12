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

(*---*)
let map =
List.rev (List.rev_map)
;;

(*---*)
let power x y =
	let rec innerpower x y =
		if y = 0 then 1
		else x * innerpower x (y-1)
	in
		if y >= 0 then innerpower x y
		else invalid_arg "power"
;;

(*---*)
let incseg l =
	List.fold_right (fun x t -> x::List.map ((+) x) t) l []
;;

(*---*)
let rec remove x = function
	[] -> []
   |h::t -> if x = h then t
			else h :: remove x t
;;

(*---*)
let divide = (* ver ejercicio 7.2 *)

;;

(*---*)
let rec compress = function
	| h1::h2::t -> if h1 = h2 then compress (h2::t)
					else h1 :: compress (h2::t)
	| l -> l
;;