type 'a g_tree = Gt of 'a * 'a g_tree list;;

let rec size = function 
    Gt (_,[]) -> 1
  | Gt (r,h::t) -> size h + size (Gt (r,t))
;;

let rec height = function
    Gt (_,[]) -> 1   
  | Gt (r,h::t) -> (max (1+height h) (height (Gt (r,t))))
;;

let leaves tree =
    let rec aux sol = function
        Gt (r,[])   -> r::sol
      | Gt (r,h::[])-> (aux sol h)
      | Gt (r,h::t) -> (aux sol h) @ (aux sol (Gt(r,t)))
    in aux [] tree 
;;     

let rec mirror = function
    Gt(r,[]) -> Gt(r,[]);
  | Gt(r,l)  -> Gt(r, List.rev (List.map mirror l))
;;


let rec preorder t =
    let rec aux l t = match t with
        Gt(r,[]) -> l @ [r]
      | Gt (r,h::[])-> r :: (l @ (aux l h))      
      | Gt (r,h::t)  -> r :: (l @ (aux l h) @ ((fold_left (@) l (List.map preorder t))))
    in aux [] t
;;


let rec postorder t =
    let rec aux l t = match t with
        Gt(r,[]) -> l @ [r]
      | Gt (r,h::[])-> (l @ (aux l h)) @ [r] 
      | Gt (r,h::t)  -> (l @ (aux l h) @ ((fold_left (@) l (List.map postorder t)))) @ [r]
    in aux [] t
;;