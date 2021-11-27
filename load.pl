loadDay(FILEname):-
    write('Reading your diary so hard...'), nl, !,
    [FILEname], !,
    write('Game data successfully loaded!'), nl.

loadDay(_):-
    write('Sadly, you did not write anything that day'), nl.