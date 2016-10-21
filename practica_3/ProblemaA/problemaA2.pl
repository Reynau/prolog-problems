% https://es.wikipedia.org/wiki/Problema_del_caballo
pasos(4).
tamano(8).

camino( E,E, C,C, 0).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal, P ):-
  P > 0,
  unPaso( EstadoActual, EstSiguiente ),
  \+member( EstSiguiente, CaminoHastaAhora ),
  P1 is P-1,
  camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal, P1).

% 2 Up 1 Right
unPaso([F1,C1],[FF,CF]) :- tamano(N), F1 + 1 < N, C1 + 2 < N, FF is F1 + 1, CF is C1 + 2.
% 2 Up 1 Left
unPaso([F1,C1],[FF,CF]) :- tamano(N), F1 - 1 >= 0, C1 + 2 < N, FF is F1 - 1, CF is C1 + 2.
% 2 Down 1 Right
unPaso([F1,C1],[FF,CF]) :- tamano(N), F1 + 1 < N, C1 - 2 >= 0, FF is F1 + 1, CF is C1 - 2.
% 2 Down 1 Left
unPaso([F1,C1],[FF,CF]) :- tamano(N), F1 - 1 >= 0, C1 - 2 >= 0, FF is F1 - 1, CF is C1 - 2.
% 2 Right 1 Up
unPaso([F1,C1],[FF,CF]) :- tamano(N), F1 + 2 < N, C1 + 1 < N, FF is F1 + 2, CF is C1 + 1.
% 2 Right 1 Down
unPaso([F1,C1],[FF,CF]) :- tamano(N), F1 + 2 < N, C1 - 1 >= 0, FF is F1 + 2, CF is C1 - 1.
% 2 Left 1 Up
unPaso([F1,C1],[FF,CF]) :- tamano(N), F1 - 2 >= 0, C1 + 1 < N, FF is F1 - 2, CF is C1 + 1.
% 2 Left 1 Down
unPaso([F1,C1],[FF,CF]) :- tamano(N), F1 - 2 >= 0, C1 - 1 >= 0, FF is F1 - 2, CF is C1 - 1.

solucionOptima:-
  pasos(P),
  camino([0,0],[0,4],[[0,0]],C,P),
  !,
  write(C),
  nl.
