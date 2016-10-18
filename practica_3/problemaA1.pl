
camino( E,E, C,C ).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
  unPaso( EstadoActual, EstSiguiente ),
  \+member( EstSiguiente, CaminoHastaAhora ),
  camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).

% LLenamos los cubos
unPaso([0,_],[5,_]).
unPaso([_,0],[_,8]).
% Vaciamos los cubos
unPaso([5,_],[0,_]).
unPaso([_,8],[_,0]).
% Verter contenido
unPaso([_,8],[5,0]). % El de 8 en el de 5
unPaso([5,0],[0,5]). % El de 5 en un cubo8 vacio
unPaso([5,8],[0,8]). % El de 5 en un cubo8 lleno

solucionOptima:-
  nat(N),                         % Buscamos solución de "coste" 0; si no, de 1, etc.
  camino([0,0],[0,4],[[0,0]],C),  % En "hacer aguas": -un estado es [cubo5, cubo8], y
  length(C,N),                    % -el coste es la longitud de C.
  write(C).
