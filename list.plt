%load_test_files(list). pour charger ces tests.
%run_test. pour lancer les tests.


:- begin_tests(list_test).
:- ensure_loaded([list]).

test(lastOfList_one) :- 
		 lastOfList(a,[a]).


test(lastOfList_full) :- 
		 lastOfList(a,[b,c,a]).



test(inverseList) :-
        inverseList([a,b], [b,a]).



test(palindrome_empty) :-
		       isPalindrome([]).
test(palindrome_one) :-
		     isPalindrome([a]).
test(palindrome_full) :-
		      isPalindrome([a,b,c,b,a]).

:- end_tests(list_test).