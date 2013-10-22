% exercices sur les Listes
 :-module(list,
	            [lastOfList/2,
		     lastButOneOfList/2,
		     kthOfList/3,
		     nbrElementList/2,
		     inverseList/2,
		     isPalindrome/1,
		     append/3,
		     flatten/2]). 


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


%5 inverser une liste
inverseList(X,X,[]):-!.
inverseList(X,Y,[H2|T2]) :-  inverseList(X,[H2|Y],T2).

inverseList([],[]):-!.
inverseList(X,[H|T]) :- inverseList(X,[],[H|T]).


%6 dire si la liste est un palindrome
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
