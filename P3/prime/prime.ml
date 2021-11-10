let is_prime n =
let rec check_from i =
i >= n ||
(n mod i <> 0 && check_from (i+1))
in check_from 2;;

let rec next_prime n =
if is_prime(n+1) then (n+1) else next_prime(n+1);; 

let rec last_prime n =
if is_prime(n) then n else last_prime(n-1);;

let is_prime2 n =
let k=int_of_float(sqrt(float_of_int(n)))
in let rec check_from2 i =
i <= n ||
( n mod i <> 0 && check_from2(i+1))
in check_from2 k;;


let is_prime2 n =
let k=int_of_float(sqrt(float_of_int(n)))
in let rec check_from2 i =
i >= n ||
( n mod i <> 0 && (if i<k then check_from2(i+1) else true))
in check_from2 2;;
