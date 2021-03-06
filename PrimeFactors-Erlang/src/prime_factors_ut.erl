-module(prime_factors_ut).
-compile(export_all).
-import(prime_factors, [factors/1]).
-import(lists, [foldl/3]).

test() ->
    [] = foldl(fun({Expected, Number}, Acc) ->
                       case factors(Number) of
                           Expected ->
                               Acc;
                           Other ->
                               [{found,Other,expected,Expected}|Acc]
                       end
               end,
               [],
               [
                {[],        1},
                {[2],       2},
                {[3],       3},
                {[2, 2],    4},
                {[5],       5},
                {[2, 3],    6},
                {[7],       7},
                {[2, 2, 2], 8},
                {[3, 3],    9},
                {[1789],    1789}
               ]).
