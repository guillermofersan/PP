();;
(*- : unit = ()*)

2 + 5 * 3;;
(*- : int = 17*)

1.0;;
(*. : float=1.*)

(*1.0 * 2;;*)
(*Error de tipo, operando de tipo float con operador de tipo int, la operacion de operandos int junto a operandos float no esta permitida*)

(*2 - 2.0;;*)
(*Error de tipo, operando de tipo float con operador de tipo int, la operacion de operandos int junto a operandos float no esta permitida*)

(*3.0 + 2.0;;*)
(*Error de tipo, operando de tipo float con operador de tipo int, la operacion de operandos int junto a operandos float no esta permitida*)

5 / 3;;
(*- : int = 1*)

5 mod 3;;
(*- : int = 2*)

3.0 *. 2.0 ** 3.0;;
(*- : float = 24.*)

3.0 = float_of_int 3;;
(*- : bool = true*)

(*sqrt 4;;*)
(*Error de tipo, operando de tipo int en operacion de tipo float*)

int_of_float 2.1 + int_of_float (-2.9);;
(*- : int = 0*)

truncate 2.1 + truncate (-2.9);;
(*truncate 2.1 + truncate -2.9;;*)

(*ceil 2.1 + ceil -2.9;;*)
(*Error de tipo, la funcion ceil es de tipo float a int, no es funcional con numeros negativos ya que interpreta el signo como operador de resta*)

2.0 ** 3.0 ** 2.0;;
(*- : float = 512.*)

'B';;
(*- : char = 'B'*)

int_of_char 'A';;
(*- : int = 65*)

char_of_int 66;;
(*- : char = 'B'*)

Char.code 'B';;
(*- : int = 66*)

Char.chr 67;;
(*- : char = 'C'*)

'\067';;
(*- : char = 'C'*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*- : char = 'm'*)

Char.uppercase 'm';;
(*- : char = 'M'*)

Char.lowercase 'O';;
(*- : char = 'o'*)

"this is a string";;
(*- : string = "this is a string"*)

String.length "longitud";;
(*- : int = 8*)

(*"1999" + "1";;*)
(*Error de tipo: operandos de tipo string en una operacion tipo int*)

"1999" ^ "1";;
(*- : string = "19991"*)

int_of_string "1999" +1;;
(*- : int = 2000*)

"\064\065";;
(*- : string = "@A"*)

string_of_int 010;;
(*string_of_int 010;;*)

not true;;
(*- : bool = false*)

true && false;;
(*- : bool = false*)

true || false;;
(*- : bool = true*)

(1<2) = false ;;
(*- : bool = false*)

2 < 12;;
(*- : bool = true*)

"2" < "12";;
(*- : bool = false*)

"uno" < "dos";;
(*- : bool = false*)

if 3=4 then 0 else 4;;
(*- : int = 4*)

if 3=4 then "0" else "4";;
(*- : string = 4*)

(*if 3=4 then 0 else "4";;*)
(*Error de tipo: expresion de tipo string en vez de tipo int*)

(if 3<5 then 8 else 10) + 4;;
(*- : int = 12*)

2.0 *. asin 1.0;;
(*- : float = 3.14159265358979312*)

sin(2.0 *. asin 1.0 /. 2.);;
(*- : float = 1.*)

function x-> 2 * x;;
(*- : int -> int = <fun>*)

let x = 1;;
(*val x : int = 1*)

let y = 2;;
(*val y : int = 2*)

x-y;;
(*- : int = -1*)

let x = y in x - y;;
(*- : int = 0*)

x-y;;
(*- : int = -1*)

(*z;;*)
(*Error: z no tiene asignado ningún valor*)

let z = x + y;;
(*val z : int = 3*)

z;;
(*- : int = 3*)

let x = 5;;
(*val x : int = 5*)

z;;
(*- : int = 3*)

let z = x + y;;
(*val z : int = 7*)

z;;
(*- : int = 7*)

let y = 5 in x+y;;
(*- : int = 10*)

x+y;;
(*- : int = 7*)

let x = x + y in let y = x * y in  x + z + y;;
(*- : int = 28*)

x + y + z;;
(*- : int = 14*)

int_of_float;;
(*- : float -> int = <fun>*)

float_of_int;;
(*- : int -> float = <fun>*)

int_of_char;;
(*- : char -> int = <fun>*)

char_of_int;;
(*- : int -> char = <fun>*)

abs;;
(*- : int -> int = <fun>*)

sqrt;;
(*- : float -> float = <fun>*)

truncate;;
(*- : float -> int = <fun>*)

ceil;;
(*- : float -> float = <fun>*)

floor;;
(*- : float -> float = <fun>*)

Char.code;;
(*- : char -> int = <fun>*)

Char.chr;;
(*- : int -> char = <fun>*)

Char.uppercase;;
(*- : char -> char = <fun>*)

Char.lowercase;;
(*- : char -> char = <fun>*)

int_of_string;;
(*- : string -> int = <fun>*)

string_of_int;;
(*- : int -> string = <fun>*)

String.length;;
(*- : string -> int = <fun>*)

let f = function x -> 2 * x;;
(*val f : int -> int = <fun>*)

f (2+1);;
(*- : int = 6*)

f 2 + 1;;
(*- : int = 5*)

let n=1;;
(*val n : int = 1*)

let g x = x + n;;
(*val g : int -> int = <fun>*)

g 3;;
(*- : int = 4*)

let n=5;;
(*val n : int = 5*)

g 3;;
(*- : int = 4*)
