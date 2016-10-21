
% Seleccionas un elemento. Por cada elemento restante del array, miras si esta adyaciente,
% si lo está, miras si está libre la siguiente en su direccion. Si todo cumple, saltas,
% eliminas la casilla y vas al siguiente paso, si no cumple vuelve recursivamente.

solve(L) :-
  length(L,N),
  camino(L,[],C,N),
  !,
  write(C),
  nl.

camino( _, C,C, 1).
camino( ListaFichas, CaminoHastaAhora, CaminoTotal, N ):-
  member(E1,ListaFichas), % Cogemos una ficha
  member(E2,ListaFichas), % Cogemos otra ficha
  E1 \= E2,               % Tienen que ser distintas
  jump(ListaFichas,E1,E2,NE1),  % Mira si la primera puede saltar sobre la segunda
  delete(ListaFichas,E2,NuevaLista),  % Elimina la ficha saltada de la lista
  N1 is N - 1,            % Decrementa el tamaño de la lista
  camino(NuevaLista,[NE1|CaminoHastaAhora],CaminoTotal,N1).

jump(T,[X1,Y1],[X2,Y2],[XF,YF]) :-
  XX is X1 - X2,
  YY is Y1 - Y2,
  AX is abs(XX),
  AY is abs(YY),
  AX == 1,             % X adyaciente
  AY == 1,             % Y adyaciente
  XF is X1 - 2 * (XX), % calculates next X
  YF is Y1 - 2 * (YY), % calculates next Y
  \+member([XF,YF],T).      % empty position


main:- solve([[4,1],[4,2],[5,2],[5,3]]).
