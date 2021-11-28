:- dynamic(quest/6).
:- include('player.pl').
:- include('farm.pl').
:- include('fishing.pl').
:- include('farm.pl').

quest(0,0,0,0,0,0).

isQuestFinished :-
    quest(0,_,0,_,0,_).

quest :-
    write('anjing rila 1'),
    isQuestFinished,
    write('anjing rila 2'),
    player(_, Lvl, _, _, _, _, _, _, _, _),
    write('anjing rila 3'),
    questLevel(Lvl),
    write('anjing rila 4'),
    tasks.

quest :-
    write('anjing rila 5'),
    \+ isQuestFinished, nl,
    write('anjing rila 6'),
    write('You have an on-going quest!'), nl.

/*add (Jumlah, TipeItem) */
addFarming(N, T) :-
    quest(TempX, _, Y, TypeY, Z, TypeZ),
    retract(quest(TempX, _, Y, TypeY, Z, TypeZ)),
    X is N + TempX,
    asserta(quest(X, T, Y, TypeY, Z, TypeZ)).

addFishing(N, T) :-
    quest(X, TypeX, TempY, _, Z, TypeZ),
    retract(quest(X, TypeX, TempY, _, Z, TypeZ)),
    Y is N + TempY,
    asserta(quest(X, TypeX, Y, T, Z, TypeZ)).

addRanching(N, T) :-
    quest(X, TypeX, Y, TypeY, TempZ, _),
    retract(quest(X, TypeX, Y, TypeY, TempZ, _)),
    Z is N + TempZ,
    asserta(quest(X, TypeX, Y, TypeY, Z, T)).

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
    quest(X, TypeX, Y, TypeY, Z, TypeZ),
    write('▀█▀ ▄▀█ █▀ █▄▀ █▀  ▀\n'), nl,
    write(' █░ █▀█ ▄█ █░█ ▄█  ▄\n'), nl,
    write('Here are the tasks that you need to do.\n'),nl,
    write('You need to collect : \n'),nl,
    format('- ~d', [X]), writeTypePlant(TypeX),
    format('- ~d', [Y]), writeTypeFish(TypeY),
    format('- ~d', [Z]), writeTypeRanch(TypeZ).

tasks :- 
    game_start(0), !,
    write('You have not started the game! \n'),
	write('Type \'start\' to start the game... \n').

farmCompleted(TypeQuest) :-
    TypeQuest =:= 1, !,
    quest(0,_,_,_,_,_), nl,
    write('▀█▀ ▄▀█ █▀ █▄▀ █▀   █▀▀ █▀█ █▀▄▀█ █▀█ █░░ █▀▀ ▀█▀ █▀▀ █▀▄ █\n'), nl,
    write('░█░ █▀█ ▄█ █░█ ▄█   █▄▄ █▄█ █░▀░█ █▀▀ █▄▄ ██▄ ░█░ ██▄ █▄▀ ▄\n'), nl,
    write('You got some rewards!\n'),
    addExp(1).

fishCompleted(TypeQuest) :-
    TypeQuest =:= 2, !,
    quest(_,_,0,_,_,_), nl,
    write('▀█▀ ▄▀█ █▀ █▄▀ █▀   █▀▀ █▀█ █▀▄▀█ █▀█ █░░ █▀▀ ▀█▀ █▀▀ █▀▄ █\n'), nl,
    write('░█░ █▀█ ▄█ █░█ ▄█   █▄▄ █▄█ █░▀░█ █▀▀ █▄▄ ██▄ ░█░ ██▄ █▄▀ ▄\n'), nl,
    write('You got some rewards!\n'),
    addExp(2).

ranchCompleted(TypeQuest) :-
    TypeQuest =:= 3, !,
    quest(_,_,_,_,0,_), nl,
    write('▀█▀ ▄▀█ █▀ █▄▀ █▀   █▀▀ █▀█ █▀▄▀█ █▀█ █░░ █▀▀ ▀█▀ █▀▀ █▀▄ █\n'), nl,
    write('░█░ █▀█ ▄█ █░█ ▄█   █▄▄ █▄█ █░▀░█ █▀▀ █▄▄ ██▄ ░█░ ██▄ █▄▀ ▄\n'), nl,
    write('You got some rewards!\n'),
    addExp(3),!.

questCompleted :-
    quest(0,_,0,_,0,_), nl,
    write('▀█▀ ▄▀█ █▀ █▄▀ █▀   █▀▀ █▀█ █▀▄▀█ █▀█ █░░ █▀▀ ▀█▀ █▀▀ █▀▄ █\n'), nl,
    write('░█░ █▀█ ▄█ █░█ ▄█   █▄▄ █▄█ █░▀░█ █▀▀ █▄▄ ██▄ ░█░ ██▄ █▄▀ ▄\n'), nl,
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    NGold is Gold + 25*Level,
    write('You got some rewards!\n'),
    format('Current Gold: ~d\n', [NGold]),
    retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
    asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, NGold)).

finishQuest(_,_) :-
    isQuestFinished, !.

finishQuest(TypeQuest, TypePlant) :-
    TypeQuest =:= 1,
    quest(TempX,TypeX,Y,TypeY,Z,TypeZ),
    TypePlant =:= TypeX -> (
        X is TempX - 1
    ),
    retract(TempX,TypeX,Y,TypeY,Z,TypeZ),
    asserta(quest(X, TypeX, Y, TypeY, Z, TypeZ)),
    addExp(1),
    farmCompleted, !,
    questCompleted, !.

finishQuest(TypeQuest, TypeFish) :-
    TypeQuest =:= 2,
    quest(X,TypeX,TempY,TypeY,Z,TypeZ),
    TypeFish =:= TypeY -> (
        Y is TempY - 1
    ),
    retract(quest(X,TypeX,TempY,TypeY,Z,TypeZ)),
    asserta(qquest(X,TypeX,Y,TypeY,Z,TypeZ)),
    addExp(2),
    fishCompleted, !,
    questCompleted, !.

finishQuest(TypeQuest, TypeRanch) :-
    TypeQuest =:= 3,
    quest(X,TypeX,Y,TypeY,TempZ,TypeZ),
    TypeRanch =:= TypeZ -> (
        Z is TempZ - 1
    ),
    retract(quest(X,TypeX,Y,TypeY,TempZ,TypeZ)),
    asserta(quest(X,TypeX,Y,TypeY,Z,TypeZ)),
    addExp(3),
    ranchCompleted, !,
    questCompleted, !.
