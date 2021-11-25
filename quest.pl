:- dynamic(quest/3).
:- include('player.pl').
:- include('farm.pl').
:- include('fishing.pl').
:- include('farm.pl').

startQuest :-
    asserta(quest(0,0,0)),!.

isQuestFinished :-
    quest(0,0,0).

quest :-
    startQuest,
    isQuestFinished,
    player(_, Level, _, _, _, _, _, _, _),
    questLevel(Level),
    tasks, !.

quest :-
    \+ isQuestFinished, nl,
    write('FINISH YOUR tasksS FIRST!'), nl.

/*add (Jumlah, TipeItem) */
addFarming(N, T) :-
    quest(TempX, _, Y, TypeY, Z, TypeZ),
    retract(quest(TempX, _, Y, TypeY, Z, TypeZ)),
    X is N + TempX,
    asserta(quest(X, T, Y, TypeY, Z, TypeZ)),!.

addFishing(N, T) :-
    quest(X, TypeX, TempY, _, Z, TypeZ),
    retract(quest(X, TypeX, TempY, _, Z, TypeZ)),
    Y is N + TempY,
    asserta(quest(X, TypeX, Y, T, Z, TypeZ)),!.

addRanching(N, T) :-
    quest(X, TypeX, Y, TypeY, TempZ, _),
    retract(quest(X, TypeX, Y, TypeY, TempZ, _)),
    Z is N + TempZ,
    asserta(quest(X, TypeX, Y, TypeY, Z, T)),!.

questLevel(Level) :-
    Level =< 3,
    random(1,10,TypeX), random(1,3,X), addFarming(X, TypeX),
    random(1,11,TypeY), random(1,2,Y), addFishing(Y, TypeY),
    random(1,3,TypeZ), random(1,2,Z), addRanching(Z, TypeZ).

questLevel(Level) :-
    Level =< 7,
    random(1,10,TypeX), random(1,5,X), addFarming(X, TypeX),
    random(1,11,TypeY), random(1,4,Y), addFishing(Y, TypeY),
    random(1,3,TypeZ), random(1,4,Z), addRanching(Z, TypeZ).

questLevel(Level) :-
    Level =< 10,
    random(1,10,TypeX), random(1,8,X), addFarming(X, TypeX),
    random(1,11,TypeY), random(1,8,Y), addFishing(Y, TypeY),
    random(1,3,TypeZ), random(1,8,Z), addRanching(Z, TypeZ).

tasks :-
    game_start(1), !,
    isQuestFinished, nl,
    write('▀█▀ ▄▀█ █▀ █▄▀ █▀  ▀\n'), nl,
    write(' █░ █▀█ ▄█ █░█ ▄█  ▄\n'), nl,
    write('You do not have any tasks to complete!\n'), nl.

tasks :-
    game_start(1), !,
    \+ isQuestFinished,
    quest(X, TypeX, Y, TypeY, Z, TypeZ), nl,
    write('▀█▀ ▄▀█ █▀ █▄▀ █▀  ▀\n'), nl,
    write(' █░ █▀█ ▄█ █░█ ▄█  ▄\n'), nl,
    write('Here are the taskss that you need to do.\n'),nl.
/* to do : TULIS tasks */

tasks :- 
    game_start(0), !,
    write('You have not started the game! \n'),
	write('Type \'start\' to start the game... \n').
/*
questCompleted :-
    quest(0,0,0), nl,
    write('▀█▀ ▄▀█ █▀ █▄▀ █▀   █▀▀ █▀█ █▀▄▀█ █▀█ █░░ █▀▀ ▀█▀ █▀▀ █▀▄ █\n'), nl,
    write('░█░ █▀█ ▄█ █░█ ▄█   █▄▄ █▄█ █░▀░█ █▀▀ █▄▄ ██▄ ░█░ ██▄ █▄▀ ▄\n'), nl,
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    % Add Gold 
    write('You got some rewards!\n'),
    format('Exp : + ~d\nCurrent Gold: ~d\n', [NExp,NGold]),
    retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
    asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
    addExp(1),!.

questCompleted :- !.

finishQuest(_) :-
    isQuestFinished, fail.

finishQuest(TypeQuest) :-
    TypeQuest =:= 1, 
    quest(0,_,_),!.
     
finishQuest(TypeQuest) :-
    TypeQuest =:= 2,
    quest(_,0,_),!.

finishQuest(TypeQuest) :-
    TypeQuest =:= 3,
    quest(_,_,0),!.

finishQuest(TypeQuest) :-
    TypeQuest =:= 1,
    quest(TempX,Y,Z),
    X is TempX - 1,
    retract(quest(TempX,Y,Z)),
    asserta(quest(X,Y,Z)),
    questCompleted, !.

finishQuest(TypeQuest) :-
    TypeQuest =:= 2,
    quest(X,TempY,Z),
    Y is TempY - 1,
    retract(quest(X,TempY,Z)),
    asserta(quest(X,Y,Z)),
    questCompleted, !.

finishQuest(TypeQuest) :-
    TypeQuest =:= 3,
    quest(X,Y,TempZ),
    Z is TempZ - 1,
    retract(quest(X,Y,TempZ)),
    asserta(quest(X,Y,Z)),
    questCompleted, !.

finishQuest(_) :- !.
*/
