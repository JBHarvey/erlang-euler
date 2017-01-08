-module(euler).
-export([sumOfmultiplesOfThreeAndFiveUnder/1]).

sumOfmultiplesOfThreeAndFiveUnder(X) when X =< 1 ->
        io:format("Bad Input, must be a number higher than 1");
sumOfmultiplesOfThreeAndFiveUnder(X) ->
        IntegersBetweenOneAndX = [Number || Number <- lists:seq(1,X - 1)],
        OfThree = [T || T <- IntegersBetweenOneAndX, T rem 3 =:= 0],
        OfFive = [F || F <- IntegersBetweenOneAndX, F rem 5 =:= 0],
        MultiplesOfThreeAndFive = lists:umerge(OfThree, OfFive),
        lists:foldl(fun(X, Sum) ->
                                    X + Sum
                    end,
                    0,
                    MultiplesOfThreeAndFive).

