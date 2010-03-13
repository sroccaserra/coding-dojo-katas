-module(prime_factors).
-export([factors/1]).
-import(lists, [reverse/1]).

factors(1) -> [];
factors(X) -> reverse(factors(X, 2, [])).

factors(X, Divisor, Factors) when Divisor > X ->
    Factors;
factors(X, Divisor, Factors) ->
    case X rem Divisor of
        0 -> factors(X div Divisor, Divisor, [Divisor|Factors]);
        _ -> factors(X, Divisor + 1, Factors)
    end.
