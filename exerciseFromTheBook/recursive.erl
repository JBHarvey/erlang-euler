-module(recursive).
-export([tail_fac/1,tail_duplicate/2,tail_reverse/1,tail_sublist/2]).

%% 
%% Note: only the tail-recursive function should be used in real
%%       application context. They are infinitely more efficient
%%       on the memory and runtime.
%%       The non-tail versions are here for academic purpose.
%%
%%       Also, these functions are ~all Built-In Function and thus
%%       the actual BIFs should be used instead of these :)
%%

% Computes factorial.
fac(0) -> 1;
fac(N) when N > 0  -> N*fac(N-1).

tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).

% Duplicates a Term N times and puts it in a list.
duplicate(0,_) ->
        [];
duplicate(N,Term) when N > 0 ->
        [Term|duplicate(N-1,Term)].

tail_duplicate(N,Term) ->
        tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) ->
        List;
tail_duplicate(N,Term,List) when N > 0 ->
        tail_duplicate(N-1, Term, [Term|List]).

% Reversing a list.
reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T,[H|Acc]).

% Return a list containing the N first elements of another list
sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].

tail_sublist(L,N) -> tail_reverse(tail_sublist(L,N,[])).

tail_sublist(_, 0, SubList)  -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
        tail_sublist(T, N-1, [H|SubList]).


% Take 2 lists of the same lenght and creates joins them in a list of 
% tuple that all hold two terms.
zip([],[]) -> [];
zip([X|Xs], [Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

% does the same, but with 2 lists that might not be of same lenght and 
% stops whenever it's done parsing the shorter one.
lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs],[Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].

tail_lenient_zip(First,Second) -> tail_reverse(tail_lenient_zip(First, Second, [])).

tail_lenient_zip([], _, SubList) -> SubList;
tail_lenient_zip(_, [], SubList) -> SubList;
tail_lenient_zip([X|Xs], [Y|Ys], SubList) ->
        tail_lenient_zip([Xs],[Ys],[{X,Y}|SubList]).

% Quicksort

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
        {Smaller, Larger} = partition(Pivot,Rest,[],[]),
        quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_. [], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
        if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
           H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
        end.

lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
        lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
        ++ [Pivot] ++
        lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).

