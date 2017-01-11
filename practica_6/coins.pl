:- use_module(library(clpfd)).

ejemplo(0,   26, [1,2,5,10] ).  % Solution: [1,0,1,2]
ejemplo(1,  361, [1,2,5,13,17,35,157]).

main:- 
    ejemplo(0,Amount,Coins),
    nl, write('Paying amount '), write(Amount), write(' using the minimal number of coins of values '), write(Coins), nl,nl,
    length(Coins,N), 
    length(Vars,N),                 % Get list of N prolog vars

    Vars ins 0..Amount,             % Vars values will be between 0 and Amount
    coins_val(Vars, Coins, Value),  % Define how to get the value of the coins
    Value #= Amount,                % Then, than value must be equal to Amount
    sum(Vars, #=, NumCoins),        % Calculates the number of coins this solution is using
    labeling([min(NumCoins)],Vars), % Then labels with a minimum coins restriction

    nl, write(Vars), nl,nl, halt.
    
coins_val([],[], 0).
coins_val([V|Vars], [C|Coins], Result):-
	mult_sum(Vars, Coins, Sum),
	Result = Sum + V * C.

