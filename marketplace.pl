:- dynamic(inStore/0).

/* Masuk store jika berada pada petak marketplace di map */
store :- game_start(0),!, write('The game has not started, type "start." to play the game').
store :- playerPos(X, Y), \+elmtPeta(X, Y, 'M'), !, write('There is no store here').
store :-
    (inStore ->
        write('You are already in a store, use "exitStore." to exit')
    ;
        assertz(inStore),
        write('What do you want to buy?'), nl,
        write('1. Level 2 Hoe (700 Gold)'), nl,
        write('2. Level 3 Hoe ()'), nl,
        write('3. Level 4 Hoe'), nl,
        write('4. Level 5 Hoe'), nl,
        write('5. Level 2 Fishing Rod'), nl,
        write('6. Level 3 Fishing Rod'), nl,
        write('7. Level 4 Fishing Rod'), nl,
        write('8. Level 5 Fishing Rod'), nl
    ).

exitStore :- game_start(0),!, write('The game has not started, type "start." to play the game').
exitStore :-
    (inStore ->
        retract(inStore),
        write('Thank you for coming')
    ;
        write('You are not in a store')
    ).

