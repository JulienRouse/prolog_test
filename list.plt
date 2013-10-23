%load_test_files(list). pour charger ces tests.
%run_tests. pour lancer les tests.


:- begin_tests(list_test).
:- use_module(list).


%-------------------------------------------------------------
%test de lastOfList/2
%-------------------------------------------------------------
test(lastOfList_empty,[fail]) :-
		       lastOfList(_,[]).

test(lastOfList_one) :- 
		 lastOfList(a,[a]).

test(lastOfList_full) :- 
		 lastOfList(a,[b,c,a]).
%-------------------------------------------------------------
%tests de lastButOneOfList
%---------------------------------------------------------------
test(lastButOneOfList_empty,[fail]) :-
			lastButOneOfList(_,[]).
test(lastButOneOfList_one,[fail]) :-
			 lastButOneOfList(_,[a]).
test(lastButOneOfList_two) :-
			 lastButOneOfList(a,[a,b]).
test(lastButOneOfList_full) :-
			 lastButOneOfList(f,[a,b,c,d,e,f,g]).
%-------------------------------------------------------------
%test de kthOfList
%-------------------------------------------------------------
test(kthOfList_empty,[fail]):-
		kthOfList(_,[],_).
test(kthOfList_null,[fail]):-
		kthOfList(_,[_],0).
test(kthOfList_one) :- 
		kthOfList(a,[a],1).
test(kthOfList_full) :-
		kthOfList(c,[a,b,c,d,e,f],3).    
%--------------------------------------------------------------
%test nbrElementList
%--------------------------------------------------------------

test(nbrElementList_empty) :-
     		nbrElementList(0,[]).
test(nbrElementList_one) :-
     		nbrElementList(1,[a]).
test(nbrElementList_full) :-
     		nbrElementList(4,[a,b,c,d]).
%---------------------------------------------------------
%test inverseList
%-------------------------------------------------------------

test(inverseList_empty) :-
        inverseList([], []).
test(inverseList_one) :-
        inverseList([a], [a]).
test(inverseList_full) :-
        inverseList([a,b,c], [c,b,a]).

%----------------------------------------------------------------
%
%---------------------------------------------------------------

test(palindrome_empty) :-
		       isPalindrome([]).
test(palindrome_one) :-
		     isPalindrome([a]).
test(palindrome_full) :-
		      isPalindrome([a,b,c,b,a]).

:- end_tests(list_test).