
%1 Ціла частина та остача від ділення

ost(A,B,A):-A<B,!.
ost(A,A,0):-!.
ost(A,B,N):-minus(A,B,A1), ost(A1,B,N).

cila(A,B,M) :- cila2(A,B,M,0).
cila2(A,B,M1,M1):- A<B,!.
cila2(A,A,M2,M1):-s(M1,M2),!.
cila2(A,B,M,M1):-minus(A,B,A1), s(M1,M2),cila2(A1,B,M,M2).

% cilaost(10,3,M,N).
cilaost(A,B,M,N):-ost(A,B,N),cila(A,B,M).

%2. Піднесення до степені(лінійне)
% pow1(2,4,Z).
pow1(0,_,0):-!.
pow1(_,0,1):-!.
pow1(X,1,X):-!.
pow1(X,Y,Z):-multS(X,Y,Y,X,Z).

%2. Піднесення до степені(логарифмічне)
% pow2(2,4,R).
pow2(_,0,1):-!.
pow2(A,N,R):-ost(N,2,O),O=0,N1=N/2,pow2(A,N1,R1),R is R1*R1;
	      N1 is N-1,pow2(A,N1,R1),R is R1*A.

%3. Числа Фібоначчі(рекурсивно) 
% fib1(6,R).
fib1(0,0):-!.
fib1(1,1):-!.
fib1(N,R):-minus(N,1,N1),minus(N,2,N2), fib1(N1,R1), fib1(N2,R2), summa(R1,R2,R).


%3. Числа Фібоначчі(ітеративно)
fib2(N, R1) :-asserta(fib2(1, 0, 1)),
			  repeat,(retract(fib2(N1, R2, R1)),( N1 == N,!;
												  N0 is N1 + 1,R0 is R2 + R1,assert(fib2(N0, R1, R0)),fail )).
				  
%4.Розклад числа на прості множники	  
% factors(9,T).
factors(1,[1]) :-!.
factors(X,[F|T]) :-between(2,X,F), cila(X,F,X2), (X mod F) =:= 0,factors(X2,T), !.
		 
%5.Обрахувати сумму 1/1! + 1/2! + 1/3! + ... 1/n!
% sum1(2,R).
sum1(N,0):-N<1,!.
sum1(N,R):-N1=N-1,sum1(N1,R1),factorial(N,C),R is R1+1/C.

%Допоміжні функції
% Функція слідування
s(X,Y):-Y is X+1.
% Визначення функції dec1(x)=x-1
dec1(X,Y):-s(0,T1),dd(X,0,T1,Y).
dd(X,Y,Z,Y):-X=Z,!.
dd(X,Y,Z,V):-s(Y,Y1),s(Z,Z1),dd(X,Y1,Z1,V).
% Визначення функції обчислення суми двох чисел
summa(X,0,X):-!.
summa(X,Y,Z):-s(X,X1),dec1(Y,Y1),summa(X1,Y1,Z).
% Різниця двох чисел
minus(X,Y,0):-X=<Y,!.
minus(X,Y,Z):-mn(X,Y,0,Z).
mn(X,Y,Z,Z):-summa(Y,Z,X1),X1=X,!.
mn(X,Y,Z,V):-s(Z,Z1),mn(X,Y,Z1,V).
% Множення
mult(_,0,0):-!.
mult(0,_,0):-!.
mult(X,Y,Z):-ml(X,X,Y,Z).
ml(_,Y,Z,Y):-s(0,Z1),Z1=Z,!.
ml(X,Y,Z,V):-dec1(Z,Z1),summa(X,Y,Y1),ml(X,Y1,Z1,V).
multS(_,_,1,Z,Z):-!.
multS(X,Y,L,S,Z):-mult(S,X,Sm), dec1(L,L_1),multS(X,Y,L_1,Sm,Z).
% Факторіал
factorial(N, R) :- factorial(N, 1, R).
factorial(0, R, R) :- !.
factorial(N, Acc, R) :-
    NewN is N - 1,
    NewAcc is Acc * N,
    factorial(NewN, NewAcc, R).