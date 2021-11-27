:- dynamic(save_counter/1).
:- dynamic(save_list/1).
/* List Data Type */
/* InsertAt */
addTo([],X,X):- !.
addTo([A|B],C,[A|D]):-
    addTo(B,C,D).

insertAt(L,E,1,[E|L]).
insertAt([H|T],E,P,Result):-
    Next is P-1,
    insertAt(T,E,Next,Temp),
    addTo([H],Temp,Result).

/* Delete Element */
deleteElmt(Element, [Element|Tail], Tail).
deleteElmt(Element, [Head|Tail], [Head|NextTail]):-
    deleteElmt(Element, Tail, NextTail).

/* House */
save_list([]).
save_counter(1).
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
        % Pull facts
        days_count(CurrentDay),
        save_counter(DayCounter),
        save_list(SavedFiles),

        % Insert current day to the list
        insertAt(SavedFiles,CurrentDay,DayCounter,Temp),
        retract(save_list(_)),
        assertz(save_list(Temp)),
        NextCounter is DayCounter + 1,
        retract(save_counter(_)),
        assertz(save_counter(NextCounter)),

        % Converting user input to txt
        number_atom(CurrentDay, ConvertedSaveString),
        atom_concat(ConvertedSaveString, '.txt', ConvertedSaveName),
        saveDay(ConvertedSaveName),
        house
    );
    X =:= 3 -> (
        write('Type the day number you want to rejoice to!'), nl,
        write('Stored diaries:'),
        save_list(SavedList), 
        write(SavedList), nl,
        read(UserDay),

        % Delete chosen day from list
        deleteElmt(UserDay, SavedList, Temp),
        retract(save_list(_)),
        assertz(save_list(Temp)),

        % Converting user input to txt
        number_atom(UserDay, ConvertedLoadString),
        atom_concat(ConvertedLoadString, '.txt', ConvertedLoadName),
        loadDay(ConvertedLoadName),
        house
    );
    X =:= 4 -> (
        !    
    )
).

sleep:-
    write('Wakey wakey, rise and shine!'), nl,
    write('A brand new day has arrived!'), nl,
    reset_time.

% DEBUGGING PURPOSES
%ranch:-
%    write('This is the ranch').

marketplace:-
    write('This is the marketplace').

questing:-
    write('This is the questing area').