(*---------------- sep 22 ---------------*)

let alltrue = function _ -> true;;

let allfalse = function x -> false;;

let sqr = function x -> x*x;

let cuadrado = sqr;;

let id x = x;;

function <x> -> <f> <x> = <f>;;

let id_int : int -> int = function x -> x;;

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

let rec append l1 l2 =  match l1 with
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

let rec qsort1 ord = function
    [] -> []
  | h::t -> let after, before = List.partition (ord h) t in
            qsort1 ord before @ h :: qsort1 ord after
;;

let qsort1aux l =
    qsort1 (<=) l;;

let qsort2aux l =
    qsort2 (<=) l;;

let msort2aux l =
    msort2 (<=) l;;    

let msort1aux l =
    msort1 (<=) l;;    

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

(*-----------------------nov 8--------------------------*)



let rec fusion l1 l2 = match l1,l2 with
  [],l | l,[] -> l
   |h1::t1,h2::t2 -> if h1<= h2 then h1::fusion(t1 l2)
                else h2::fusion(l1 t2)
;;

let rec divide = function
  h1::h2::t-> let l1 l2 = divide t in
        h1::l1, h2::l2
   |l -> l,[]
;;     

let mergeSort l = match l with
  [] | [_] -> l
   |_ -> let l1,l2=divide l in 
        fusion (mergeSort l1) (mergeSort l2)
;;



(*-------------- problema de las reinas -------------------*)


let come (i1,j1) (i2,j2) =
  i1=i2 || j1=j2 || abs (i2-i1) = abs (j2-j1)
;;

let rec compatible c = function
  []-> true;
 |h::t -> not (come c h) && compatible c t
;; 

let reinas n =
    let rec completa camino (i,j) =
        if i > n then camino 
        else if j > n then raise Not_found 
        else if compatible (i,j) camino then
            try completa((i,j)::camino) (i+1,1) with 
            Not_found -> completa camino (i,j+1)
            else completa camino (i,j+1)
    in
        completa [] (1,1)
;;



(*-------nov 15-------*)

type 'a option =
    Some of 'a
  | None

let (//) m n =
    if n <> 0 then Some (m/n)
    else None
;;      

(*problema de las reinas ocn lo de arriba*)


let come (i1,j1) (i2,j2) =
  i1=i2 || j1=j2 || abs (i2-i1) = abs (j2-j1)
;;

let rec compatible c = function
  []-> true;
 |h::t -> not (come c h) && compatible c t
;; 

(*reinas: int -> (int*int) list option*)
let reinas n =
    let rec completa camino(i,j) =
        if i > n then Some camino 
        else if j > n then None
        else if compatible (i,j) camino then
            match completa ((i,j)::camino) (i+1,1) with 
            None->completa camino (i, j+1)
            |sol->sol
        else completa camino (i,j+1)
    in
        completa [] (1,1)
;;


(*no solucion->lista vacia
 *solucion-> lista con sol
 *menos elegante
 *)

(*reinas: int -> (int*int) list list*)
let reinas n =
    let rec completa camino(i,j) =
        if i > n then [camino] 
        else if j > n then []
        else if compatible (i,j) camino then
            match completa ((i,j)::camino) (i+1,1) with 
            []->completa camino (i, j+1)
            |sol->sol
        else completa camino (i,j+1)
    in
        completa [] (1,1)
;;


(*TODAS LAS SOLUCIONES :D*)


let all_reinas n =
    let rec completa camino(i,j) =
        if i > n then [camino] 
        else if j > n then []
        else if compatible (i,j) camino 
        then completa ((i,j)::camino) (i+1,1) @ 
             completa camino(i,j+1)
        else completa camino (i,j+1)
    in
        completa [] (1,1)
;;



let rec print_sol = function
    []-> print_newline()
    |(i,j)::[] -> print_int j; print_newline()
    |(i,j)::t -> print_int j; print_char ','; print_sol t
;;    



let reinas_sol_num n =
    let rec completa camino(i,j) =
        if i > n then 1
        else if j > n then 0
        else if compatible (i,j) camino 
        then completa ((i,j)::camino) (i+1,1) + 
             completa camino(i,j+1)
        else completa camino (i,j+1)
    in
        completa [] (1,1)
;;


(*------------------17 nov-------------------*)



type maybe_an_int =
    Some of int
  | None
;;  


# None;;
- : maybe_an_int = None
# Some 3;;
- : maybe_an_int = Some 3
# Some (-2);;
- : maybe_an_int = Some (-2)

# Option.Some 3;;
- : int Option.t = Option.Some 3
# Option.Some 'a';;
- : char Option.t = Option.Some 'a'



let (//) x y = match (x,y) with 
    Some _, Some 0 -> None
  | Some a, Some b -> Some (a/b)
  | _ -> None
;;  
(*
# Some 7 // Some 0 // Some 3;;    
- : maybe_an_int = None
# Some 0;;
*)



type booleano = V | F;;


let (&&&) b1 b2 = match (b1,b2) with
    V,V->V 
  | _-> F
;;      
# V &&& F &&& V;;
- : booleano = F
# V &&& V;;
- : booleano = V




let v=V;;
let (|||) b1 b2 = match (b1,b2) with
    v,_ -> v
  | _   -> F
;;
(*# F ||| V;;
- : booleano = F ERROR, MAL DEFINIDA
*)


let (|||) b1 b2 = match (b1,b2) with
    V,_| _,V -> V    
   | _ -> F
;;

type palo = Pica | Trebol | Diamante | Corazon;;
(*ES LO MISMO QUE*)
type palo = Pica of unit | Trebol of unit | Diamante of unit| Corazon of unit


type otroint = Int of int;;

(*
# Int 3;;
- : otroint = Int 3
# Int 56;;
- : otroint = Int 56
# Int 3 = Int 5;;
- : bool = false
# Int 3 = Int 3;;
- : bool = true
*)

type dobleint = L of int | R of int;;

type numero = F of float | I of int;;


let rec (++) n1 n2 = match (n1,n2) with
    I x, I y -> I (x+y)
   | F x, F y -> F (x +. y)
   | I x, F y -> F (float x +. y)
   | _-> n2 ++ n1
;;   


(*-------------------nov 22-------------------*)

type maybe_an_int = 
   Some_i of int
  |None_i
;;

type maybe_a_string =
    Some_s of string 
   |None_s
;;

type 'a option =
    Some of 'a
   |None         
;;

(*
# Some "abc"
  ;;
- : string option = Some "abc"
# Some 3;;
- : int option = Some 3
*)

type nat =
    O 
   |S of nat 
;;
(*
# S O;;
- : nat = S O
# S (S O);;
- : nat = S (S O)
*)

let rec nat_of_int = function
    0 -> O 
   |n -> S (nat_of_int (n-1))
;;

let nat_of_int n = 
    if n<0 then raise (Invalid_argument "nat_of_int")
         else nat_of_int n 
;;


let rec sum n1 = function
    O -> n1
  | S n2 -> sum (S n1) n2 
;;
(*
# let x=nat_of_int 3;;
val x : nat = S (S (S O))
# let y= S (S O);;    
val y : nat = S (S O)
# sum x y;;
- : nat = S (S (S (S (S O))))
# 
*)



(*-----------ÁRBOL-----------*)

type 'a tree =
    V
  | N of 'a * 'a tree * 'a tree 
;;
(*
V->vacio
N->arbol


# V;;
- : 'a tree = V
# N (3,V,V);;
- : int tree = N (3, V, V)
# N (3,N (1,V,V),V);;
- : int tree = N (3, N (1, V, V), V)
# 
*)

let h x = N (x,V,V);; (*HOJA*)

                     2
              7             5
          2      6            9
               5   11       4

(*
# h 3;;
- : int tree = N (3, V, V)
*)

let t6 = N (6, h 5, h 11);;
(*val t6 : int tree = N (6, N (5, V, V), N (11, V, V))*)

let t7 = N (7,h 2, t6);;
(*val t7 : int tree = N (7, N (2, V, V), N (6, N (5, V, V), N (11, V, V)))*)

let t9 = N (9, h 4, V);;
(*val t9 : int tree = N (9, N (4, V, V), V)*)

let t5 = N (5,V, t9);;
(*val t5 : int tree = N (5, V, N (9, N (4, V, V), V))*)

let t= N (2,t7,t5);;
(*val t : int tree =
  N (2, N (7, N (2, V, V), N (6, N (5, V, V), N (11, V, V))),
   N (5, V, N (9, N (4, V, V), V)))
*)

let tree2=N (2, N (7, N (2, V, V), N (6, N (5, V, V), N (11, V, V))),
   N (5, V, N (9, N (4, V, V), V)))
  ;;
(*
# t=tree2;;
- : bool = true
*)

let rec numnodos = function
    V->0
  | N (_,i,d) -> 1 + numnodos i + numnodos d
;;


let rec altura= function
    V->0
  | N (_,i,d)-> 1+ max(altura i) (altura d)   
;;


let rec sum_nodos = function
    V->0
  | N (x,i,d) -> x + sum_nodos i + sum_nodos d  
;;

let rec preorder = function 
    V -> []
  | N (x,i,d) -> (x :: (preorder i)) @ (preorder d)  
;;

hojas

mirror

(*------------------BINARY TREE-------------------*)

type 'a btree = 
    Leaf of 'a
  | Node of 'a * 'a btree * 'a btree  
;;

let rec mirror = function
    Leaf x -> Leaf x
  | Node (x,i,d) -> Node (x, mirror d, mirror i)
;;


type 'a gtree=
    GT of 'a * 'a gtree list
;;

# let g= GT(2,[GT(7,[h 2; h 10; GT (6, [h 5; h 11])]);GT(5,[GT(9,[h 4])])]);;
(*val g : int gtree = GT (2,
   [GT (7, [GT (2, []); GT (10, []); GT (6, [GT (5, []); GT (11, [])])]);
    GT (5, [GT (9, [GT (4, [])])])])
*)

let rec nngtree = function (*cuenta el nnnnnnnnnnnnnnnnumero de nnnnnnnnnnnnnnnnnnodos*)
    GT (_,l)-> List.fold_left (+) 1 (List.map nngtree l)
;;    

let rec nngtree = function (*esto sera otra implementacion supongo*)
    GT (_,[])    -> 1
  | GT (r, h::t) -> nngtree h + nngtree (GT (r,t))
;;

let rec anchura = function
    Gt (x,[]) -> [x]
  | Gt (x, Gt(y,l2)::l1) -> x :: anchura (Gt (y,l1@l2))
;;






(*-------------------------------------*)


type 'a bin_tree =
    V
  | N of 'a * 'a bin_tree * 'a bin_tree
;;

type 'a st_tree = 
    Leaf of 'a
  | Node of 'a * 'a st_tree * 'a st_tree  
;;

let rec bin_tree_of_st_tree = function
    Leaf x -> N (x,V,V)
  | Node (x,i,d) -> N (x,bin_tree_of_st_tree i, bin_tree_of_st_tree d) 
;;

let rec st_tree_of_bin_tree = function
    V-> raise (Invalid_argument "st_tree_of_bin_tree")
  | N (x,V,V) -> Leaf x 
  | N (x,i,d) -> Node (x,st_tree_of_bin_tree i, st_tree_of_bin_tree d)
;;

let rec hojas = function
    V -> []
  | N (x,V,V) -> [x]
  | N(_,i,d) -> hojas i @ hojas d
;;    

let rec leaves = function
    V -> []
  | N(_,i,d) -> leaves i @ leaves d
;; 




(*------------------general tree-----------------------*)

type 'a gtree=
    GT of 'a * 'a gtree list
;;

# let g= GT(2,[GT(7,[h 2; h 10; GT (6, [h 5; h 11])]);GT(5,[GT(9,[h 4])])]);;
(*val g : int gtree = GT (2,
   [GT (7, [GT (2, []); GT (10, []); GT (6, [GT (5, []); GT (11, [])])]);
    GT (5, [GT (9, [GT (4, [])])])])
*)

let rec nngtree = function (*cuenta el nnnnnnnnnnnnnnnnumero de nnnnnnnnnnnnnnnnnnodos*)
    GT (_,l)-> List.fold_left (+) 1 (List.map nngtree l)
;;    

let rec nngtree = function (*esto sera otra implementacion supongo*)
    GT (_,[])    -> 1
  | GT (r, h::t) -> nngtree h + nngtree (GT (r,t))
;;

let rec anchura = function
    GT (x,[]) -> [x]
  | GT (x, GT(y,l2)::l1) -> x :: anchura (GT (y,l1@l2))
;;



(***********************************************)

# output_char;;          
- : out_channel -> char -> unit = <fun>
# stdout;;
- : out_channel = <abstr>


# output_char stdout 'X';;
X- : unit = ()



# let print_char c = output_char stdout c;;
val print_char : char -> unit = <fun>
# print_char 'X';;
X- : unit = ()
# print_char;;
- : char -> unit = <fun>
# Stdlib.print_char;;
- : char -> unit = <fun>


<e1> ; <e2>

let _ = <e1> in <e2>


(**********************dic 1***************************)


# "Hola";;
- : string = "Hola"
# "Hola" .[0];;
- : char = 'H'
# "Hola" .[3];;
- : char = 'a'


let output_string canal s =
    let n = String.length s in 
    let rec loop i =
        if i >=n then ()
        else (output_char canal s.[i] ;loop (i+1))
    in
        loop 0
;;

(*
# output_string stdout "Hola";;
Hola- : unit = ()
# 
*)

let print_string s = output_string stdout s;;
(*
# print_string "hola";;
hola- : unit = ()
*)

let print_endline s = print_string (s ^ "\n");;

let print_newline = print_endline("");;



(*writting to a file*)

let read_line () = input_line stdin;;

let s = open_out "prueba";; (*nombre del fichero*)

output_char s 'X';;

output_string s "ABC";;

close_out s;;

let s = open_out "prueba";; (*nombre del fichero*)

output_char s 'X';;

output_string s "ABC";;

flush s;;

output_string s "DEF";;

close_out s;;

(**************************************************************)


let rec output_string_list c = function
    []-> ()
  | h::t ->output_string c (h ^ "\n"); output_string_list c t
;;   

# let s = open_out "prueba2";;
(*val s : out_channel = <abstr>*)
# output_string_list s ["AB";"ECR";"eyy"];;
(*- : unit = ()*)
# close_out s;;
(*- : unit = ()*)

(*now the file "prueba2" contains:
AB
ECR
eyy
*)


let rec iter p = function
    []->()
  | h::t -> p h; iter p t  
;;


let output_string_list c l = 
    List.iter (fucntion s -> output_string c (s ^ "\n")) l
;;  


let c = open_in "prueba"



(********************************************)


let rec output_string_list c = function
    [] -> ()
  | h::t -> output_string c (h ^ "\n"); output_string_list c t
  ;;  


let s = open_out "pruebaa";;
output_string_list s ["AB";"ECR";"hola"];;
close_out s;;

(*
guillemo@guillermo:~$ more pruebaa
AB
ECR
hola
*)

(***********ITER***********)

let rec iter p = function
    []->()
  | h::t -> p h; iter p t  
;;

let output_string_list c l =
    List.iter (fun s -> output_string c (s ^ "\n")) l
;;    

(*opens (lectura) *)

(*
open_out si no existe lo crea
open_in error si no existe
*)

let c = open_in "prueba";;

let rec input_string_list c =
    try
        input_line c :: input_string_list c
    with
     End_of_file -> []
;;     


type 'a tree =
    V
  | N of 'a * 'a tree * 'a tree 
;;


#let f = open_out "arbol";;
    val f : out_channel = <abstr>
# let t = N (1,N (2, N (3,V,V), N (4,V,V)), N(5,V,V));;
    val t : int tree = N (1, N (2, N (3, V, V), N (4, V, V)), N (5, V, V))
# output_value f t;;
    - : unit = ()
# close_out f;;
    - : unit = ()

$ more arbol
����
$ cat arbol
�����A�B�C@@�D@@�E@@

# let e = open_in "arbol";;
    val e : in_channel = <abstr>
# seek_in e 0;;
    - : unit = ()
# let t2 = (input_value e : int tree);;
    val t2 : int tree = N (1, N (2, N (3, V, V), N (4, V, V)), N (5, V, V))



(***************VARIABLES*****************)


# let i = ref 8;;
    val i : int ref = {contents = 8}
# !i;;
    - : int = 8
# i;;
    - : int ref = {contents = 8}

# !i + 3;;
    - : int = 11

# i := 5;; 
    - : unit = ()
# !i;;
    - : int = 5


# i := !i+1;;
- : unit = ()
# !i;;
- : int = 6

(********************LOOPS*******************)

for i = 0+1 to 4+1 do print_endline(string_of_int i) done;;


let fact n =
    let f = ref 1 in
    for i=1 to n do
        f := !f * i
    done;
    !f
;;

for i = 1 to 20 do print_endline(string_of_int (fact i)) done;;
1
2
6
24
120
720
5040
40320
362880
3628800
39916800
479001600
6227020800
87178291200
1307674368000
20922789888000
355687428096000
6402373705728000
121645100408832000
2432902008176640000




(**************************************************)


let fact n =
    let f = ref 1 and i = ref 1 in 
    while !i<=n do 
    f := !f * !i;
    i:= !i+1;
    done;
    !f
;;

# [||];;
    (*- : 'a array = [||]*)
# let v = [|1;2;3;4;5|];;
    (*val v : int array = [|1; 2; 3; 4; 5|]*)


# Array.make 10 0;;
    (*- : int array = [|0; 0; 0; 0; 0; 0; 0; 0; 0; 0|]*)

# Array.init 10 (fun _ -> Random.float 1.);;
    (*- : float array =
    [|0.926038888360971146; 0.341638588598232096; 0.597822945853105914;
      0.866881591014789565; 0.786668034537743921; 0.625315015859070122;
      0.0909889847839877169; 0.311009969786768425; 0.559742196386998736;
      0.153847848802657422|]*)


# let v = Array.init 10 (fun _ -> Random.float 1.);;
val v : float array =
 (*) [|0.00976621539525168; 0.756637587325766692; 0.248343259525787813;
    0.652787092477089326; 0.98717731495272254; 0.167445477467496828;
    0.557458224883505826; 0.758516786217373; 0.68532904647625259;
    0.46752184914410938|]*)
# let w = Array.copy v;;
val w : float array =
  (*[|0.00976621539525168; 0.756637587325766692; 0.248343259525787813;
    0.652787092477089326; 0.98717731495272254; 0.167445477467496828;
    0.557458224883505826; 0.758516786217373; 0.68532904647625259;
    0.46752184914410938|]*)


(*******Producto escalar********)    

let vprod v1 v2=
    let l = Array.length v1 in 
    if Array.length v2 = l then
        let p= ref 0. in 
        for i=0 to l-1 do 
            p:= !p +. v1.(i) *. v2.(i)
        done;
        !p 
    else 
        raise (Invalid_argument "vprod")
;;


# vprod v w;;
(*- : float = 3.63731818809045127*)


let vprod2 v1 v2 = 
    Array.fold_left (+.) 0. (Array.map2 ( *. ) v1 v2)
;;    

# vprod2 v w;;
(*- : float = 3.63731818809045127*)


(**********************REGISTROS****************************)

type persona = {nombre : string; edad : int};;
    (*type persona = { nombre : string; edad : int; }*)
let p1 = {nombre="Guillermo";edad=17};;
    (*val p1 : persona = {nombre = "Guillermo"; edad = 17}*)




























































































































































































































































































































































































































































































































































































































































































































































































































V


























































































































































































































































































































































































































































































































































































































































































vv




.
