%:- include('time.pl').

/* House */
house:-
    write('What do you wish to do here?'), nl,
    write('1. Sleep'), nl,
    write('2. Exit'), nl,
    read(X),
    (
    X =:= 1 -> (
        sleep
    )
).

sleep:-
    reset_time.

% DEBUGGING PURPOSES
ranch:-
    write('This is the ranch').

marketplace:-
    write('This is the marketplace').

questing:-
    write('This is the questing area').