:- dynamic(diaries/3).
:- dynamic(diaries_counter/1).
:- dynamic(save_list/1).
:- dynamic(save_counter/1).

% diaries(Counter, Day, Message)
diaries(1, -1, _).
diaries(2, -1, _).
diaries(3, -1, _).
diaries(4, -1, _).
diaries(5, -1, _).
diaries(6, -1, _).
diaries(7, -1, _).
diaries(8, -1, _).
diaries(9, -1, _).
diaries(10, -1, _).
diaries(11, -1, _).
diaries(12, -1, _).
diaries(13, -1, _).
diaries(14, -1, _).
diaries(15, -1, _).
diaries(16, -1, _).
diaries(17, -1, _).
diaries(18, -1, _).
diaries(19, -1, _).
diaries(20, -1, _).
diaries(21, -1, _).
diaries(22, -1, _).
diaries(23, -1, _).
diaries(24, -1, _).
diaries(25, -1, _).
diaries(26, -1, _).
diaries(27, -1, _).
diaries(28, -1, _).
diaries(29, -1, _).
diaries(30, -1, _).

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

/* Initialize dynamic variables */
diaries_counter(1).
save_list([]).
save_counter(1).

writeDiary:-
    days_count(CurrentDay),
    diaries_counter(Counter),
    save_list(DayListIn),
    save_counter(DayCounter),
    write('Write your diary for Day '),
    write(CurrentDay), nl,
    write('Dont forget to put a single tick before and after your diary!'), nl,
    read(UserDiary),
    retract(diaries(Counter, _, _)),
    assertz(diaries(Counter, CurrentDay, UserDiary)),
    NextCounter is Counter + 1,
    retract(diaries_counter(_)),
    assertz(diaries_counter(NextCounter)),

    % Insert current day to the list
    insertAt(DayListIn,CurrentDay,DayCounter,Temp),
    retract(save_list(_)),
    assertz(save_list(Temp)),
    NextCounter is DayCounter + 1,
    retract(save_counter(_)),
    assertz(save_counter(NextCounter)).

readDiary:-
    save_list(DayListOut),
    write('These are your entries on your diary:'), nl,
    write(DayListOut), nl,
    write('Which entry do you want to read?'), nl,
    read(UserDay),
    diaries(_, UserDay, Message),
    write('Here is your diary for that day!'), nl,
    write(Message), nl.