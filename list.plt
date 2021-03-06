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
%test isPalindrome
%---------------------------------------------------------------

test(palindrome_empty) :-
		       isPalindrome([]).
test(palindrome_one) :-
		     isPalindrome([a]).
test(palindrome_full) :-
		      isPalindrome([a,b,c,b,a]).

%-------------------------------------------------------------
%test flatten and append
%------------------------------------------------------------

test(append_empty) :-
	append([],[],[]).
test(append_one) :-
 	append([a],[b],[a,b]).
test(append_full) :-
	append([a,b,c],[b,c,a],[a,b,c,b,c,a]).

test(flatten_empty) :-
	flatten([],[]).
test(flatten_one) :-
        flatten([a],[[a]]).
test(flatten_full) :-
	flatten([a,b,c,d,e,f],[a,[b,[c,d],[e]],f]).

%----------------------------------------------------------------
%test compress
%---------------------------------------------------------------
test(compress_empty):-
	compress([],[]).
test(compress_one):-
	compress([a],[a,a,a]).
test(compress_full):-
	compress([a,b,c],[a,a,a,b,c,c,c,c]).

%------------------------------------------------------------------
%test pack
%------------------------------------------------------------------
test(pack_empty):-
	pack([],[]).
test(pack_one):-
	pack([[a]],[a]).
test(pack_empty):-
	pack([[a,a,a],[b,b]],[a,a,a,b,b]).

%------------------------------------------------------------------
%test encode
%------------------------------------------------------------------
test(encode_empty):-
	encode([],[]).
test(encode_one):-
	encode([[1,a]],[a]).
test(encode_full):-
	encode([[2,a],[3,b]],[a,a,b,b,b]).

%-----------------------------------------------------------------
%test dupli/2
%-----------------------------------------------------------------

test(dupli2_empty):-
	dupli([],[]).
test(dupli2_one):-
	dupli([a,a],[a]).
test(dupli2_full):-
	dupli([a,a,b,b,a,a,a,a],[a,b,a,a]).

%-------------------------------------------------------------------
%test dupli/3
%-----------------------------------------------------------------

test(dupli3_empty):-
	dupli([],0,[aaaa]).
test(dupli3_one):-
	dupli([a,a],1,[a,a]).
test(dupli3_two):-
	dupli([a,a,b,b],2,[a,b]).
test(dupli3_full):-
	dupli([a,a,a,a,a,a,b,b,b],3,[a,a,b]).

%--------------------------------------------------------------------
%test drop_nth/3
%----------------------------------------------------------------------
test(drop_nth3_empty):-
	drop_nth([],_,[]).
test(drop_nth3__one):-
	drop_nth([a],2,[a,b]).
test(drop_nth3_two):-
	drop_nth([],1,[a,b,c]).
test(drop_nth3_three):-
	drop_nth([a,c],2,[a,b,c,d]).

%--------------------------------------------------------------------
%
%----------------------------------------------------------------------

%--------------------------------------------------------------------
%
%----------------------------------------------------------------------

%--------------------------------------------------------------------
%
%----------------------------------------------------------------------




:- end_tests(list_test).