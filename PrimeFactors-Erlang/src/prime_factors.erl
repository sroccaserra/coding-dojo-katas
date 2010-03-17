-module(prime_factors).
-export([factors/1]).
-import(lists, [reverse/1]).
-import(math, [sqrt/1]).

factors(N) -> reverse(factors(N, 2, [])).

factors(1, _Divisor, Factors) -> Factors;

factors(N, Divisor, Factors) when N rem Divisor =:= 0 ->
    factors(N div Divisor, Divisor, [Divisor|Factors]);

factors(N, Divisor, Factors) ->
    case Divisor > sqrt(N) of
        true -> [N|Factors];
        false -> factors(N, Divisor + 1, Factors)
    end.
