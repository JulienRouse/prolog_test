% exercices sur l''arithmetic
 :-module(arithmetic,
	            [is_prime/1,
		     prime_factors/2]).

%1 Determine whether a given integer number is prime.

% first method: trial division
% divide n by k, with k=2..n^1/2 inclusive, if the result is an integer, then n isnt prime 

is_prime(X,N,Y):-N>Y,!.
is_prime(X,N,Y):-!,N<Y,X1 is X mod N, X1 \= 0,N1 is N+1, is_prime(X,N1,Y).
is_prime(X):-sqrt(X,Y),is_prime(X,2,Y).

% slowest of the 3 method but still quite fast, is_prime(104729) print without delay.
% same for is_prime(1299827)
% same for is_prime(982451653) wich is the fifthiest million prime if http://primes.utm.edu/lists/small/millions/ that source is right.
 
% second method: fermat''s little theorem
% third method: miller tabin
% maybe ill try those methods one day, but for now, the first method is fast enough that i dont need to worry.


%2 Determine the prime factors of a given positive integer.

prime_factors(L,N).
