:- dynamic(diaries/3).
:- dynamic(diaries_counter/1).
:- dynamic(save_list/1).
:- dynamic(save_counter/1).

% diaries(Counter, Day, Message)
diaries(1, -1, Message).
diaries(2, -1, Message).
diaries(3, -1, Message).
diaries(4, -1, Message).
diaries(5, -1, Message).
diaries(6, -1, Message).
diaries(7, -1, Message).
diaries(8, -1, Message).
diaries(9, -1, Message).
diaries(10, -1, Message).
diaries(11, -1, Message).
diaries(12, -1, Message).
diaries(13, -1, Message).
diaries(14, -1, Message).
diaries(15, -1, Message).

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
    write(Message).