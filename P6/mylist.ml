let hd = function
	h::_ -> h
	| [] -> raise (Failure "hd")
;;


let tl = function
	_::t -> t
	| [] -> raise (Failure "tl")
;;


let rec length = function
	[]-> 0 
	| _::t -> 1+length t
;;


let rec compare_lengths l1 l2 = match l1, l2 with
	[], [] -> 0
	| [],_ -> -1
	| _,[] -> 1
	| _::t1, _::t2 -> compare_lengths t1 t2
;;


let rec nth l n = match l with
	[] -> raise (Failure "nth")
	| h::t -> if n=0 then h else nth t (n-1) 
;;			   


let rec append l1 l2 = match l1 with 
	[]    -> l2
	|h::t -> h:: append t l2
;;


(*----------*)


let rec find f = function
	[]->raise (Failure "find")
	|h::t -> if f h then h else find f t
;;

let rec for_all f = function
	[]-> true
	| h::t -> f h && for_all f t
;;	

let rec exists f = function
	[] -> false
	|h::t -> f h || exists f t
;;	 

let rec mem n = function
	[] -> false
	| h::t -> h=n || mem n t
;;

let filter f l= 
	let rec aux l1 l2 = match l1 with
		[]->rev l2
		|h::t-> if f h then aux t (h::l2)
					  else aux t l2
	in aux l []		  
;;	

let find_all = filter;;


let rec partition f = function
	[] -> ([],[])
	| h::t -> let (fst,snd) = partition f t in
		     if f h then (h::fst,snd) else (fst,h::snd)
;;



let rec split = function
    [] -> ([], [])
    | (h1, h2)::t -> let l1, l2 = split t in (h1::l1, h2::l2)
;;



let rec combine l1 l2= match (l1,l2) with
	([], []) -> []
	| (h1::t1),(h2::t2) -> (h1,h2)::(combine t1 t2)
	| (_,_) -> raise (Failure "combine")
;;

(*--------------*)

let init i f= 
	let rec aux (j,l) =
		if j=0 then l else let k = j-1 in aux (k,f k::l)
	in aux(i,[])
;;	 

let rec rev = function
    []-> []
    |h::t -> append (rev t) [h]
;;

let rec rev_append l1 l2 = match l1 with
	[]-> l2
	| h::t -> rev_append t (h::l2)
;;


let rec concat = function
    [] -> []
    | h::t -> append h (concat t);;


let flatten=concat;;


let rec map f = function
	[] -> []
	| h::t -> f h :: map f t
;;


let rev_map l = rev (map l);;

let rec map2 f l1 l2 = match l1,l2 with
_::_,[]  -> raise(Failure "map2")
|[],_::_ -> raise(Failure "map2")
|[],[]->[]
| h1::t1,h2::t2 -> (f h1 h2)::(map2 f t1 t2)
;;

let rec fold_left f a = function
	[] -> a
	| h::t -> fold_left f (f a h) t
;;


let rec fold_right f l b = match l with
	[]->b
	| h::t -> f h (fold_right f t b)
;;
