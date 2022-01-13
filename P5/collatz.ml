let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let printorb n=
print_endline(string_of_int(f(n)));;

let rec orbit n=
    if n>1 then (Printf.printf("%d, ") n; orbit(f n))
    else print_endline (string_of_int n)
;;


let rec length = function
    1 -> 0
    | n -> 1+length(f n);;



let rec top = function
    1 -> 1
    | n ->  max n (top(f n))
;;


let rec length'n'top = function
    1-> (0,1)
    | n-> let x = length'n'top (f n) in (1 + fst x , max n (snd x))
;;



let rec longest_in m n = 
    if m=n then m 
           else if length m >= length n then longest_in m (n-1) 
                                        else longest_in (m+1) n 
;;

let rec highest_in m n = 
    if m=n then m 
           else if top m >= top n then highest_in m (n-1) 
                                  else highest_in (m+1) n 
;;
