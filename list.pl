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
		     dupli/3]). 


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

