-module(problem02).
-export([firstSolution/1]).

% Goal: sum all the even-valued terms =< X of the Fibonacci sequence.

firstSolution(Max) -> 
        Fibonacci = lists:reverse(fiboFirst(Max, [1, 0])),
        EvenFibonacci = lists:filter(fun(N) -> N rem 2 == 0 end, Fibonacci),
        lists:sum(EvenFibonacci).

fiboFirst(Max, Acc = [X|[Y|_]]) when X + Y > Max -> Acc;
fiboFirst(Max, Acc = [X|[Y|_]]) -> fiboFirst(Max, [X + Y| Acc]).
