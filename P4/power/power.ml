let rec power x y =
if y=0 then 1 else
x * power x (y-1);;

let isPar x =
x mod 2=0;;

let rec power' x y =
if y=0 then 1 else
if isPar y then power' (x*x) (y/2) else x*(power'(x*x)(y/2));;


(*El numero de iteraciones realizadas en power' es notablemente inferior al numero de iteraciones en la funcion power*)

(**)

let rec powerf x y =
if y=0 then 1.0 else
if isPar y then powerf (x*.x) (y/2) else x*.(powerf(x*.x)(y/2));;
