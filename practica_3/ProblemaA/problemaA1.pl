
camino( E,E, C,C ).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
  unPaso( EstadoActual, EstSiguiente ),
  \+member( EstSiguiente, CaminoHastaAhora ),
  camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).

% LLenamos los cubos
unPaso([_,C2],[5,C2]).
unPaso([C1,_],[C1,8]).
% Vaciamos los cubos
unPaso([_,C2],[0,C2]).
unPaso([C1,_],[C1,0]).
% Verter contenido
unPaso([C1,C2],[C1F,C2F]) :-
  C2F is min(8, C2 + C1),
  C1F is C1 - (C2F - C2).
unPaso([C1,C2],[C1F,C2F]) :-
  C1F is min(5, C1 + C2),
  C2F is C2 - (C1F - C1).


solucionOptima:-
  nat(N),                         % Buscamos solución de "coste" 0; si no, de 1, etc.
  camino([0,0],[0,4],[[0,0]],C),  % En "hacer aguas": -un estado es [cubo5, cubo8], y
  length(C,N),                    % -el coste es la longitud de C.
  write(C).

nat(0).
nat(N):- nat(N1), N is N1 + 1.
