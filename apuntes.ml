(*---------------- sep 22 ---------------*)

let alltrue = function _ -> true;;

let allfalse = function x -> false;;

let sqr = function x -> x*x;

let cuadrado = sqr;;

let id x = x;;

function <x> -> <f> <x> = <f>;;

let id_int : int -> int = funcion x -> x;;

let id_int = function (x : int) - x;;

let id_int : int -> int = id;;

if <b> then <e1> else <e2>

let abs x =
  if x>0 then x else -x;;
  
let f = function true -> 1 | false -> -1;;
let abs x=f (x>=0) * x;;

let as x=
  let
    g=function true -> 1 | false -> -1
  in
    g(x>=0) * x;;
    

let as x=
let
  g=function true -> 1 | false -> -1
in
  function x-> g(x>=0) * x
;;




if ... then ... else

AND &&

OR ||

<b1> && <b2>

<b1> || <b2>


let suma = function x -> function y-> x+y;;






(*-----------------------*)





let f = function x -> function y -> x + y;;
(* val f : int -> int -> int = <fun> *)


let f = function x -> (function y -> x + y);;

(* f: int -> (int -> int *)

let f x = function y -> x + y;;


let saluda = (^) "hola, ";;

let suma (x,y) = x + y;;

let suma = function (x,y)-> x+y;;





(*--------------- sep29 ---------------*)


(=) 2 3;;
- : bool = false


let positivo =  (<=) 0;; 
 (*val positivo : int -> bool = <fun*)
 
 
true, 0, "trio";;
- : bool * int * string = (true, 0, "trio")


(true, 0), "falso trio";;
- : (bool * int) * string = ((true, 0), "falso trio")

let p = (true, 0), "falso trio";;
(*val p : (bool * int) * string = ((true, 0), "falso trio")*)

let x,y=p;;
(* val x : bool * int = (true, 0)
   val y : string = "falso trio" *)

# x;;
- : bool * int = (true, 0)
# y;;
- : string = "falso trio"


# fst p;;
- : bool * int = (true, 0)
# snd p;;
- : string = "falso trio"


(* FUNCIONES RECURSIVAS *)


let rec fact n = 
  if n = 0 then 1
  else n*fact(n-1)
;;


let rec fib n =
  if n<=1 then 1
  else fib (n-1) + fib (n-2)
;;


(* oct 6 *)


let rec fib2 = function
0 -> 0,1
| n -> let f1,f2 = fib2 (n-1) in (f1+f2),f1;;

let fib n = fst(fib2 n);;




(*listas*)


let l= ['a'; 'e'; 'i'; 'o'; 'u'];;

List.hd l;;
(*- : char = 'a'*)



List.hd [];;
Exception: Failure "hd".

(*3/0;;
Exception: Division_by_zero.

Division_by_zero;;
- : exn = Division_by_zero

Failure "hd";;
- : exn = Failure "hd"*)


List.rev l;;
- : char list = ['u'; 'o'; 'i'; 'e'; 'a']


List.nth l 0;;
- : char = 'a'

List.nth l 2;;
- : char = 'i'



List.map abs [1;-2;3;-4;5];;
- : int list = [1; 2; 3; 4; 5]

# List.map (function n -> 2*n) [1;2;3;4;5];;
- : int list = [2; 4; 6; 8; 10]



List.init;;
- : int -> (int -> 'a) -> 'a list = <fun>

List.init 10 float;;       
- : float list = [0.; 1.; 2.; 3.; 4.; 5.; 6.; 7.; 8.; 9.]


List.init 10 string_of_int;;
- : string list = ["0"; "1"; "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"]

List.init 26 (function n -> char_of_int(n+65));;
- : char list =
['A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M'; 'N'; 'O';
 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'; 'Z']


List.init 500000 (function n->0);;
- : int list =
[0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;
 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; ...]




let bigl = List.init 500000 (function n->n);;
val bigl : int list =
  [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20;
   21; 22; 23; 24; 25; 26; 27; 28; 29; 30; 31; 32; 33; 34; 35; 36; 37; 38;
   39; 40; 41; 42; 43; 44; 45; 46; 47; 48; 49; 50; 51; 52; 53; 54; 55; 56;
   57; 58; 59; 60; 61; 62; 63; 64; 65; 66; 67; 68; 69; 70; 71; 72; 73; 74;
   75; 76; 77; 78; 79; 80; 81; 82; 83; 84; 85; 86; 87; 88; 89; 90; 91; 92;
   93; 94; 95; 96; 97; 98; 99; 100; 101; 102; 103; 104; 105; 106; 107; 108;
   109; 110; 111; 112; 113; 114; 115; 116; 117; 118; 119; 120; 121; 122; 123;
   124; 125; 126; 127; 128; 129; 130; 131; 132; 133; 134; 135; 136; 137; 138;
   139; 140; 141; 142; 143; 144; 145; 146; 147; 148; 149; 150; 151; 152; 153;
   154; 155; 156; 157; 158; 159; 160; 161; 162; 163; 164; 165; 166; 167; 168;
   169; 170; 171; 172; 173; 174; 175; 176; 177; 178; 179; 180; 181; 182; 183;
   184; 185; 186; 187; 188; 189; 190; 191; 192; 193; 194; 195; 196; 197; 198;
   199; 200; 201; 202; 203; 204; 205; 206; 207; 208; 209; 210; 211; 212; 213;
   214; 215; 216; 217; 218; 219; 220; 221; 222; 223; 224; 225; 226; 227; 228;
   229; 230; 231; 232; 233; 234; 235; 236; 237; 238; 239; 240; 241; 242; 243;
   244; 245; 246; 247; 248; 249; 250; 251; 252; 253; 254; 255; 256; 257; 258;
   259; 260; 261; 262; 263; 264; 265; 266; 267; 268; 269; 270; 271; 272; 273;
   274; 275; 276; 277; 278; 279; 280; 281; 282; 283; 284; 285; 286; 287; 288;
   289; 290; 291; 292; 293; 294; 295; 296; 297; 298; ...]

# List.length bigl;;
- : int = 500000
List.hd (List.rev bigl);;
- : int = 499999

let rec last l =
if List.tl l =[] then List.hd l
else last(List.tl l)
;;

last bigl;;
- : int = 499999


(*Error: has to count every item (calculation too long*)
let rec last l =
if List.length l =1 then List.hd l
else last(List.tl l)
;;





(*----------------*)

let rec length l =
	if l=[] then 0
	else 1 + length(List.tl l)
;;

let rec length2 = function
   [] -> 0
 | _::t -> 1+ length t;;
 


let hd = function
    h::_-> h
    | [] -> 1/0
;;


raise

let hd = function
	h::_ -> h
	| []->raise (Failure "hd")
;;	


let hd = function
h::_ -> h
| _->raise (Failure "hd")
;;	


let rec last l =
if List.tl l =[] then List.hd l
else last (List.tl l)
;;




let rec last = function
h::[] -> h
| _::t -> last t
| [] -> raise (Failure "last")
;;



(* oct 18 *)



let rec length = function
[]-> 0
| _::t ->1+length t
;;


let rec map f= function
[] -> []
| h::t -> f h :: map f t
;;
(*
map (function n->2*n) [1;2;3;4];;
- : int list = [2; 4; 6; 8]
*)

let rec mem x = function
[] -> false
| h::t -> x=h || mem x t
;;

(*t es la lista sin el primer item*)

let rec append = function
[] -> (function l->l)
| h::t -> (function l->h :: append t l)
;;
(*append une dos listas*)


(*append con match-with*)
let rec append l1 l2 =match l1 with 
[]->l2
|h::t -> h:: append t l2
;;


match <e> with
<p1> -> <e1>
|<p2> -> <e2>
...
| <pn> -> <en>
;;


List.compare_length
# List.compare_lengths [1;2;3;4;5] ["a";"b";"c";"d";"e"];;
- : int = 0
# compare 6 5;;
- : int = 1
# compare 4 5;;
- : int = -1
# compare 5 5;;
- : int = 0


compare_lengths l1 l2 =
compare(List.length l1)(List.length l2)
;;MAAAAL

let rec compare_lengths =function
[]-> (function []->0 
		| _->(-1))
| _::t -> (function [] -> 1
		| _::t2 -> compare_lengths t t2)
;;				


let rec compare_lengths l1 l2= match l1, l2 with
[], [] -> 0
| [],_ -> -1
| _,[] -> 1
| _::t1, _::t2 -> compare_lengths t1 t2;;



(*RECURSIVIDAD TERMINAL*)


let rec quo x y =
if x<y then 0
else 1 + quo (x-y) x;;

quo 13 5 ->
1 + quo 8 5->
1 + (1+quo 3 5)
1 + (1 + 0)
2



let rec rem x y ?
if x<y then x
else rem (x-y) y
;;

rem 8 3->
rem 5 3 ->
rem 2 3 ->
2

let rec last = function
h::[] -> h
| _::t -> last t
| [] -> raise (Failure "last")
;;


let rec length = function
[] -> 0
| _::t -> 1 + length t
;;

let rec aux i= function 
[] -> i
| _::t -> aux (i+1) t
;;

let length l = 
   let rec aux i= function 
    [] -> i
    | _::t -> aux (i+1) t
 in 
    aux 0 l   
;;



(*oct 20*)

(*not tail recursive factorial*)
let rec fact =  function
0->1
|n->n*fact(n-1)
;;


(*terminal factorial*)
let fact n=
  if n<0 then
  raise(Invalid_argument "fact")
  else 
    let rec aux f= function
    0-> f
    |i->aux (f*i) (i-1)
  in 
    aux 1 n
;;


(*fib terminal*)
let fib n=
    let rec aux(i,fi,fa) =
        if i = n then fi
        else aux(i+1,fi+fa,fi) 
    in
        aux(0,0,1)
;;      


let rec lmax = function
	h::[]->h
	|h::t-> if h >= lmax t then h else lmax t
;;



let lmax l = 
	if l=[] then raise Not_found
	else
	let rec aux m -> function
		[]->m
		|h'::t' -> aux (max m h') t'
	in 
	  aux (List.hd l, List.tl l)
;;	  	
(*ERROR*)


let rec lmax = function
h::[]->h
|h1::h2::t->lmax(max h1 h2 :: t)
;;



(*FOLD, REV... 25 OCT*)

let rec append l1 l2 =  match l1 wwith
[]-> l2
| h::t -> h::append t l2
;;


let rec rev_append l1 l2 = match l1 with
[]-> l2
| h::t -> rev_append t (h::l2)
;;

let append' l1 l2 = 
rev_append (List.rev l1) l2
;;


let rev l =
List.rev_append l []
;;


let rec rev = function
[]-> []
|h::t -> rev t @ [h]
;;


fold_left op e [a1;a2;a3] = op( op (op e a1) a2) a3 


let rec fold_left f a = function
[] -> a
| h::t -> fold_left f (f a h) t
;;

fold_left (+) 0 [1;2;3];;
- : int =6


sumlist l = fold_left (+) 0 l

let last = function
[]->raise(Failure "last")
|h::t-> fold_left (fun _ x -> x) h t
;;




(* OCT 27 *)
(*# let bigl = List.init 300_000 abs*)


let lmax = function
[]->raise(Failure "lmax")
| h::t -> fold_left max h t
;;



let rev l =
  List.fold_left (fun a b -> b::a) [] l
;;  


let for_all p l = 
(* ('a -> bool) -> 'a list -> bool *)
(* ( 'a -> 'b -> 'c ) -> 'a -> 'b list -> 'a *)
List.fold_left (fun a b -> p b && a) true l
;;

(*
# for_all  ((<=)0) bigl;;
- : bool = true
*)

(*best implementation:*)
let rec for_all f = function
  []-> true
  | h::t-> f h && for_all f t
;;



(*checkea sorted*)

let rec sorted = function
  h1::h2::t -> h1<=h2 && sorted (h2::t)
  | _ -> true
;;  

let rec insert x = function
  (*se asume lista ordenada*)
  | [] -> [x]
  | h::t -> if x<=h then x::h::t
            else h :: (insert x t)
;;

(*
  NO TERMINAL
# insert 300000 bigl;;
Stack overflow during evaluation (looping recursion?).
*)


(*insertion sort*)
let rec isort = function
[]->[]
| h::t -> insert h (isort t)
;;

(*medicion de tiempos*)
Sys.time()

let crono f x =
  let t = Sys.time () in
  let _ = f x in 
  Sys.time () -. t
;;



(*
# crono isort (List.init 10_000 (function _ -> Random.int 1_000_000));; 
- : float = 0.661504

# crono isort (List.init 20_000 (function _ -> Random.int 1_000_000));;
- : float = 3.15278300000000034

crono isort (List.init 40_000 (function _ -> Random.int 1_000_000));;
- : float = 15.994383


# 300_000./.40_000.;;
- : float = 7.5
# 7.5*.7.5*.15.994383;;
- : float = 899.68404375
# 899.68404375/.60.;;
- : float = 14.9947340625 14 minutos
# 
*)



(*----------------------nov 3---------------------*)

let rec insert f x = function
    []-> [x]
    | h::t -> if f x h then x::h::t
              else h::(insert f x t)
;;

let rec i_sort f = function
    []-> []
    | h::t -> insert f h (i_sort f t)
;;    
(*
# i_sort (>=) [1;2;3;4;5];;             
- : int list = [5; 4; 3; 2; 1]
*)










































































.
