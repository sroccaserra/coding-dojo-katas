-module(prime_factors).
-export([factors/1]).
-import(lists, [reverse/1]).
-import(math, [sqrt/1]).

factors(N) -> reverse(factors(N, 2, [])).

factors(1, _, Factors) -> Factors;
factors(N, Divisor, Factors) when N rem Divisor == 0 ->
    factors(N div Divisor, Divisor, [Divisor|Factors]);
factors(N, Divisor, Factors) ->
    Sqrt = sqrt(N),
    if
        Divisor > Sqrt -> [N|Factors];
        true -> factors(N, Divisor + 1, Factors)
    end.
