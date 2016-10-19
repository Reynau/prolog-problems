
pasos(15).

camino(E,E, C,C,_).
camino(EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal,Limite):-
    unPaso(EstadoActual, EstSiguiente, Limite),
    \+member(EstSiguiente, CaminoHastaAhora),
    pasos(P),
    length(CaminoHastaAhora,L),
    L =< P,
    camino(EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal,Limite).

% 2 Up 1 Right
unPaso([F1,C1],[FF,CF],N) :- F1 + 1 < N, C1 + 2 < N, FF is F1 + 1, CF is C1 + 2.
% 2 Up 1 Left
unPaso([F1,C1],[FF,CF],N) :- F1 - 1 >= 0, C1 + 2 < N, FF is F1 - 1, CF is C1 + 2.
% 2 Down 1 Right
unPaso([F1,C1],[FF,CF],N) :- F1 + 1 < N, C1 - 2 >= 0, FF is F1 + 1, CF is C1 - 2.
% 2 Down 1 Left
unPaso([F1,C1],[FF,CF],N) :- F1 - 1 >= 0, C1 - 2 >= 0, FF is F1 - 1, CF is C1 - 2.
% 2 Right 1 Up
unPaso([F1,C1],[FF,CF],N) :- F1 + 2 < N, C1 + 1 < N, FF is F1 + 2, CF is C1 + 1.
% 2 Right 1 Down
unPaso([F1,C1],[FF,CF],N) :- F1 + 2 < N, C1 - 1 >= 0, FF is F1 + 2, CF is C1 - 1.
% 2 Left 1 Up
unPaso([F1,C1],[FF,CF],N) :- F1 - 2 >= 0, C1 + 1 < N, FF is F1 - 2, CF is C1 + 1.
% 2 Left 1 Down
unPaso([F1,C1],[FF,CF],N) :- F1 - 2 >= 0, C1 - 1 >= 0, FF is F1 - 2, CF is C1 - 1.

solucionOptima:-
  camino([1,1],  [0,0],  [[1,1]],  C, 6),
  pasos(P),
  length(C,P),
  write(C).
