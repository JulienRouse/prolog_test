% exercices sur les Listes
 :-module(list,
	            [lastOfList/2,
		     lastButOneOfList/2,
		     kthOfList/3,
		     nbrElementList/2,
		     inverseList/2,
		     isPalindrome/1,
		     append/3,
		     flatten/2,
		     compress/2,
                     pack/2,
		     encode/2,
		     dupli/2,
		     dupli/3,
		     drop_nth/3,
		     splitt/4 ,
		     slice/4,
		     rotateList/3,
		     remove_at/4]). 


%1) trouver le dernier element d''une liste 
lastOfList(H,[H|[]]):-!.
lastOfList(X,[_|T]) :- lastOfList(X,T).

 
%2) trouver l''avant dernier element d''une liste
lastButOneOfList(H,[H,_|[]]):- !.
lastButOneOfList(X,[_|T]) :- lastButOneOfList(X,T).


%3) trouver le k-ieme element d''une liste avec k en argument
kthOfList(H,[H|_],1):-!.
kthOfList(X,[_|T],K) :-K1 is K-1, kthOfList(X,T,K1).


%4) afficher le nombre d''element d''une liste
nbrElementList(0,[]):-!.
nbrElementList(1,[_|[]]):-!.
nbrElementList(X,[_|T]) :-!,  nbrElementList(X1,T) , X is X1+1 .


%5 Inverser une liste
inverseList(X,X,[]):-!.
inverseList(X,Y,[H2|T2]) :-  inverseList(X,[H2|Y],T2).

inverseList([],[]):-!.
inverseList(X,[H|T]) :- inverseList(X,[],[H|T]).


%6 Dire si la liste est un palindrome
% solution elegante trouve sur http://stackoverflow.com/questions/8669685/prolog-palindrome-functor
% beaucoup mieux que ce que j''avais fait
isPalindrome([]):- !.
isPalindrome(X) :- !,inverseList(X,X).

%7 Transform a list, possibly holding lists as elements into a 'flat' list by replacing each list with its elements (recursively).

% on ajoute append puisqu''il va nous servir 
append([X|Y],Z,[X|W]) :- append(Y,Z,W).  
append([],X,X).

% ! is the operator that stop the backtrack
flatten([], []) :- !.
flatten(FlatL,[L|Ls]) :-
    !,
    flatten(NewL,L),
    flatten(NewLs,Ls),
    append(NewL, NewLs, FlatL).
flatten([L],L).


%8 Eliminate consecutive duplicates of list elements.
%  If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

compress([],[]):- !.
compress(X,Y):- compress(X,[],Y).

compress(Y,X,[]):-!,inverseList(Y,X).
compress(X,Y,[H1,H2|T]):- H1 == H2,!, compress(X,Y,[H1|T]).
compress(X,Y,[H1|T]):- compress(X,[H1|Y],T).

%9 Pack consecutive duplicates of list elements into sublists.
%   If a list contains repeated elements they should be placed in separate sublists.
pack([],[]):-!.
pack(X,Y):-pack(X,[],Y).

pack(X,Y,[]):-!,inverseList(X,Y).
pack(X,[],[H2|T2]):-!,pack(X,[[H2]],T2).
pack(X,[[H1|T1]|T3],[H2|T2]):- H1 == H2, !, pack(X,[[H1,H2|T1]|T3],T2).
pack(X,[[H1|T1]|T3],[H2|T2]):- H1 \= H2, !, pack(X,[[H2],[H1|T1]|T3],T2).  


%10 Run-length encoding of a list.
%   Use the result of problem 1.09 to implement the so-called run-length encoding data compression method. 
%   Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.
encodeNb([X,H],[H|T]):-nbrElementList(X,[H|T]).

encode_aux(X,Y,[]):-!,inverseList(X,Y).
encode_aux(X,Z,[H|T]):- encodeNb(A,H),encode_aux(X,[A|Z],T).  


encode([],[]):-!.
encode(X,Y):-pack(Z,Y), encode_aux(X,[],Z).

%14 Duplicate the elements of a list.

dupli_aux(X,Y,[]):-!,inverseList(X,Y).
dupli_aux(X,Y,[H|T]):-dupli_aux(X,[H,H|Y],T).


dupli([],[]):-!.
dupli(X,Y):-dupli_aux(X,[],Y).

%15 Duplicate the elements of a list a given number of times.

dupli_aux(X,Z,_,_,[]):-!, inverseList(X,Z).
dupli_aux(X,Z,0,A,[_|T]):-!, dupli_aux(X,Z,A,A,T).
dupli_aux(X,Z,Y,A,[H|T]):-Y >= 1, Y1 is Y-1, dupli_aux(X,[H|Z],Y1,A,[H|T]). 

dupli([],0,_):-!.
dupli(X,1,X):-!.
dupli(X,Y,Z):- dupli_aux(X,[],Y,Y,Z).

%16 Drop every N''th element from a list.

drop_nth(X,N,Y) :-!,drop_nth(Y,N,X,N).

drop_nth([],_,[],_):-!.
drop_nth([_|T],N,Y,1) :- !,drop_nth(T,N,Y,N).
drop_nth([H|T],N,[H|Y],K) :- K > 1, K1 is K - 1, drop_nth(T,N,Y,K1).

%17 Split a list into two parts; the length of the first part is given.
%    Do not use any predefined predicates.

splitt([],L,L,0):-!.
splitt([X|X1],X2,[X|L],N) :- N > 0, N1 is N - 1, splitt(X1,X2,L,N1).

%18 Extract a slice from a list.
% Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.
slice([],_,0,0).
slice(Z1,L,N1,N2):- N2>=N1, N4 is N1-1 , splitt(_,Y2,L,N4),N3 is N2-N4,splitt(Z1,_,Y2,N3).

%19 Rotate a list N places to the left.

rotateList([],_,[]) :- !.
rotateList(L1,N,L2) :-
   nbrElementList(N1,L2), N2 is N mod N1, splitt(R1,R2,L2,N2), append(R2,R1,L1).

%20 Remove the K''th element from a list.
tete(H,[H|_]).

% pas tres elegant, mais ca a lair de marcher,
% se repencher sur la question un peu plus tard.
remove_at(RemovedElt,RemainingList,ListOriginal,N):-
    N1 is N-1,splitt(L1,L2,ListOriginal,N1), splitt(L3,L4,L2,1),tete(RemovedElt,L3),append(L1,L4,RemainingList),!.
