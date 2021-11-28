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
        reset_time,
        sleep,
        random(1,5,Chances),
        % If chances is 3, player will meet the fairy, able to jump anywhere
        (
            Chances =:= 3 -> (
                fairy, fail   
            );
            Chances =\= 3 -> (
                house   
            )
        )
    );
    X =:= 2 -> (
        writeDiary,
        house
    );
    X =:= 3 -> (
        readDiary,
        house
    );
    X =:= 4 -> (
        !    
    )
).

sleep:-
    write('Wakey wakey, rise and shine!'), nl,
    write('A brand new day has arrived!'), nl,
    time, nl.

fairy:-
    interiorObject(House_X, House_Y, 'H'),
    interiorObject(Ranch_X, Ranch_Y, 'R'),
    interiorObject(Market_X, Market_Y, 'M'),
    interiorObject(Quest_X, Quest_Y, 'Q'),
    write('You met a fairy in your sleep!'), nl,
    write('You now can jump to any place in the map!'), nl,
    write('Please enter your desired coordinates!'), nl,
    read(Desired_X),
    read(Desired_Y),
    retract(interiorObject(Player_X,Player_Y,'P')),
    assertz(interiorObject(Desired_X,Desired_Y,'P')),
    (
        Desired_X =:= House_X, Desired_Y =:= House_Y -> (
            enter_house, fail    
        );
        Desired_X =:= Ranch_X, Desired_Y =:= Ranch_Y -> (
            enter_ranch, fail   
        );
        Desired_X =:= Market_X, Desired_Y =:= Market_Y -> (
            enter_market, fail    
        );
        Desired_X =:= Quest_X, Desired_Y =:= Quest_Y -> (
            enter_questing, fail    
        )
    ).

% DEBUGGING PURPOSES
%ranch:-
%    write('This is the ranch').

marketplace:-
    write('This is the marketplace').

questing:-
    write('This is the questing area').