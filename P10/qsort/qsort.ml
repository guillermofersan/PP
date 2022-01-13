let rec qsort1 ord = function
    [] -> []
  | h::t -> let after, before = List.partition (ord h) t in
            qsort1 ord before @ h :: qsort1 ord after
;;

(*
el peor caso para este algoritmo seria tener que ordenar
una lista que no esté balanceada
*)




let rec qsort2 ord =
    let append' l1 l2 = List.rev_append (List.rev l1) l2 in
    function
        [] -> []
        | h::t -> let after, before = List.partition (ord h) t in
                  append' (qsort2 ord before) (h :: qsort2 ord after)
;;

(*
qsort2 tiene ciertas ventajas respecto a qsort1, como el uso de
las funciones recursivas terminales rev_append y rev del modulo 
list en lugar de "@". 
qsort2 permite ordenar listas que no podrían ordenarse con qsort1
ya que permitiría ordenar listas de gran tamaño sin devolver stack 
overflow ya que cuenta con recursividad terminal
*)

let bigl = List.init 500000 (function x -> Random.int 2500);;
(*qsort1 dara stack overflow al intentar ordenar bigl, sin embargo,
qsort2 lo ordenara sin problemas
*)

(*
qsort2 cuenta con ciertas desventajas respecto a qsort1, como puede
ser su tiempo de ejecucion, que es mayor cuando la lista esta
ordenada de manera inversa.

qsort2 es aproximadamente, un 112% mas lenta que qsort1
*)