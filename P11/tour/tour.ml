open List;;


let validPosition m n (x,y) = 
    x>=1 && y>=1 && x<=m && y<=n;;

let removevisited visited l = 
    let aux laux x = not (mem x laux)
    in filter (aux visited) l
;;      

    

let posibleMoves m n (x,y) visited =
    let moves = [(x+2,y+1);(x+2,y-1);
                 (x-2,y+1);(x-2,y-1);
                 (x+1,y-2);(x-1,y-2);
                 (x-1,y+2);(x+1,y+2)]
    in removevisited visited (filter (validPosition m n) moves)
;;




let tour m n inicpos finpos =
    if not (validPosition m n inicpos && validPosition m n finpos && m>0 && n>0)
        then raise (Invalid_argument "tour")
        else let rec aux l = function
             []   -> raise Not_found
           | h::t -> if (h=finpos) then rev (h::l)
                     else try
                        aux (h::l) (posibleMoves m n h (h::l))
                     with
                     | Not_found -> aux l t
             in if (inicpos=finpos) then [inicpos]
                else aux [inicpos] (posibleMoves m n inicpos [inicpos])
;;