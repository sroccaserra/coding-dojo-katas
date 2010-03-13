-module(test_ut).
-compile(export_all).
-import(fibo, [fibo/1]).

initial_conditions_test() ->
    1 = fibo(0),
    1 = fibo(1).

computed_values_test() ->
    2 = fibo(2),
    3 = fibo(3),
    5 = fibo(4),
    8 = fibo(5).
