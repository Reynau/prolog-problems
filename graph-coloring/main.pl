:- use_module(library(clpfd)).
numVertices(5).
edges([ 1-2, 1-3, 2-4, 2-5, 3-5 ]).
numColors(3).

main:- numVertices(N), numColors(K), edges(Edges), listOfNPrologVars(N,Vars),
	   Vars ins 1..K,
	   makeConstraints(Edges,Vars),
	   level(Vars), write(Vars), nl.

makeConstraints([ U-V | Edges ], Vars):-
	nth1(U, Vars, UVar),
	nth1(V, Vars, VVar),
	UVar #\= VVar,
	makeConstraints(Edges, Vars).
makeConstraints([], _).

listOfNPrologVars(N, [ _ | Vars ]):- N1 is N - 1, listOfNPrologVars(N1, Vars).
listOfNPrologVars(_, []):-!.