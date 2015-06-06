%fct qui v�rifient si on gagne.
win([A,B,C,D]):-B=:=A+1, C=:=A+2, D=:=A+3,!.
win([A,B,C,D]):-B=:=A+10, C=:=A+20, D=:=A+30,!.
win([A,B,C,D]):-B=:=A+11, C=:=A+22, D=:=A+33,!.
win([A,B,C,D]):-B=:=A+9, C=:=A+18, D=:=A+27,!.

%fct de d�placement
deplacement(A,B):- A=:=B+1,A<46,(A%10)<6!.
deplacement(A,B):- A=:=B+10,,A<46,(A%10)<6!.
deplacement(A,B):- A=:=B+11,,A<46,(A%10)<6!.
deplacement(A,B):- A=:=B+9,,A<46,(A%10)<6!.
deplacement(A,B):- A=:=B-1,,A>0,(A%10)<6!.
deplacement(A,B):- A=:=B-10,,A>0,(A%10)<6!.
deplacement(A,B):- A=:=B-11,,A>0,(A%10)<6!.
deplacement(A,B):- A=:=B-9,,A>0,(A%10)<6!.

%test de deplacement
d(L1, L2, A, B, 1):-member(A, L1), deplacement(A,B), not(member(B, L1)), not(member(B, L2)), swap(L1, A, B, L3), tri(L3,L4),!.
d(L1, L2, A, B, 2):-member(A, L2), deplacement(A,B), not(member(B, L1)), not(member(B, L2)), swap(L2, A, B, L3), tri(L3,L4),!.

%fct de swap
swap([C|R1], A, B, [C|R2]):- C\=A,swap(R1, A, B, R2).
swap([A|R], A, B, [B|R]).

%fct de tri