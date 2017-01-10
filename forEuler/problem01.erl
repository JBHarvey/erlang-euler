-module(problem01).
-export([firstSolution/1, betterSolution/1]).

firstSolution(X) when X =< 1 ->
        io:format("Bad Input, must be a number higher than 1");
firstSolution(X) ->
        IntegersBetweenOneAndX = [Number || Number <- lists:seq(1,X - 1)],
        OfThree = [T || T <- IntegersBetweenOneAndX, T rem 3 =:= 0],
        OfFive = [F || F <- IntegersBetweenOneAndX, F rem 5 =:= 0],
        MultiplesOfThreeAndFive = lists:umerge(OfThree, OfFive),
        lists:foldl(fun(N, Sum) ->
                                    N + Sum
                    end,
                    0,
                    MultiplesOfThreeAndFive).

betterSolution(Y) ->
        lists:sum(lists:filter(fun(X) -> X rem 3 == 0 orelse X rem 5 == 0 end, lists:seq(1, Y-1))).
