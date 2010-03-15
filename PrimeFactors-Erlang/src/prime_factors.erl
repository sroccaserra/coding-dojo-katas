-module(prime_factors).
-export([factors/1]).
-import(lists, [reverse/1]).
-import(math, [sqrt/1]).

factors(X) -> reverse(factors(X, 2, [])).

factors(1, Divisor, Factors) -> Factors;
factors(X, Divisor, Factors) when X rem Divisor == 0 ->
    factors(X div Divisor, Divisor, [Divisor|Factors]);
factors(X, Divisor, Factors) ->
    B = Divisor > sqrt(X),
    if
        B -> [X|Factors];
        true -> factors(X, Divisor + 1, Factors)
    end.
