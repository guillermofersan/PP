let rec remove x = function
    []->[]
   |h::t-> if h=x then t else h::(remove x t)
;;  

let rec remove_all x = function
    []->[]
   |h::t-> if h=x then (remove_all x t) else h::(remove_all x t)
;;


let rec ldif l = function
  [] -> l
  | h::t -> ldif(remove_all h l) t
;;


let rec lprod l1 l2 = match l1 with
   []-> []
  | h::t -> let rec aux h1 = function
                []->[]
              | h2::t2 -> (h1,h2)::(aux h1 t2)
            in (aux h l2) @ (lprod t l2)
;;


let rec divide = function
    h1::h2::t -> let  (l1, l2) = divide t
                 in (h1::l1,h2::l2)
  | l -> l, []
;;