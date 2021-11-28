/* House */
house:-
    write('What do you wish to do here?'), nl,
    write('1. Sleep'), nl,
    write('2. Write your diary'), nl,
    write('3. Read your diary'), nl,
    write('4. Exit'), nl,
    read(X),
    (
    X =:= 1 -> (
        sleep,
        house
    );
    X =:= 2 -> (
        writeDiary
    );
    X =:= 3 -> (
        readDiary
    );
    X =:= 4 -> (
        !    
    )
).

sleep:-
    write('Wakey wakey, rise and shine!'), nl,
    write('A brand new day has arrived!'), nl,
    time, nl,
    reset_time.

% DEBUGGING PURPOSES
%ranch:-
%    write('This is the ranch').

marketplace:-
    write('This is the marketplace').

questing:-
    write('This is the questing area').