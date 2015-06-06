:- include('ordonner.pl').

%getPossibleMovementL(+B, +N, -ListPossibleMovements, +P ) 
getPossibleMovementL(B, [], _, L, 0).
getPossibleMovementL(N, _, [], L, 1).
getPossibleMovementL(B, N, L, 0):- getPossibleMovementL(B, B, N, L, 0).
getPossibleMovementL(B, N, L, 1):- getPossibleMovementL(N, B, N, L, 0).
getPossibleMovementL(B, [X|R], N, [L|R2], 0) :- 
	getPossibleMovementX(X, B, N, L, 0), getPossibleMovementL(B, R, N, R2, 0).
getPossibleMovementL(N, B, [X|R], [L|R2], 1) :- 
	getPossibleMovementX(X, B, N, L, 1), getPossibleMovementL(N, B, R, R2, 1).



%getPossibleMovementX(+FromX, +B, +N, -ListPossibleMovements, P ) 
getPossibleMovementX(X, B, N, [X2|R], 1):- d(B, N, X, X2, 1),
 	getPossibleMovement(X, B, N, R, 1).

getPossibleMovementX(X, B, N, [X2|R], 1):- not(d(B, N, X, X2, 1)),
 	getPossibleMovement(X, B, N, [X2|R], 1).

getPossibleMovementX(X, B, N, [X2|R], 0):- d(N, B, X, X2, 0), 
	getPossibleMovement(X, N, B, R, 0).
getPossibleMovementX(X, B, N, [X2|R], 0):- not(d(N, B, X, X2, 0)),
 	getPossibleMovement(X, B, N, [X2|R], 0).



%test de deplacement
d(L1, L2, A, B, 0, L4):-member(A, L1), deplacement(A,B), 
	not(member(B, L1)), not(member(B, L2)), swap(L1, A, B, L3), ordonner(L3,L4).
d(L1, L2, A, B, 1, L4):-member(A, L2), deplacement(A,B),
 	not(member(B, L1)), not(member(B, L2)), swap(L2, A, B, L3), ordonner(L3,L4).

%fct de déplacement
deplacement1(A,B):- A is B+1,A<46,(A%10)<6,!.
deplacement2(A,B):- A=:=B+10,A<46,(A%10)<6,!.
deplacement3(A,B):- A=:=B+11,A<46,(A%10)<6,!.
deplacement4(A,B):- A=:=B+9,A<46,(A%10)<6,!.
deplacement5(A,B):- A=:=B-1,,A>0,(A%10)<6,!.
deplacement6(A,B):- A=:=B-10,A>0,(A%10)<6,!.
deplacement7(A,B):- A=:=B-11,A>0,(A%10)<6,!.
deplacement8(A,B):- A=:=B-9,A>0,(A%10)<6,!.