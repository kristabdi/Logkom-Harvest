:- dynamic(quest/6).

quest(0,0,0,0,0,0).

isQuestFinished :-
    quest(X,_,Y,_,Z,_),
    X =:= 0,
    Y =:= 0,
    Z =:= 0.

quest :-
    isQuestFinished,
    retract(quest(_,_,_,_,_,_)),
    asserta(quest(0,0,0,0,0,0)),
    player(_, Lvl, _, _, _, _, _, _, _, _),
    questLevel(Lvl),
    tasks, !.

quest :- (
    quest(X, _, Y, _, Z, _),
    X > 0 -> (
        write('You have an on-going quest!\n')
    )
    ;
    Y > 0 -> (
        write('You have an on-going quest!\n')
    )
    ;
    Z > 0 -> (
        write('You have an on-going quest!\n')
    )
).

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
    Level =< 3, !,
    random(30,39,TypeX), random(1,3,X), addFarming(X, TypeX),
    random(10,19,TypeY), random(1,2,Y), addFishing(Y, TypeY),
    random(40,43,TypeZ), random(1,2,Z), addRanching(Z, TypeZ).

questLevel(Level) :-
    Level =< 7, !,
    random(30,39,TypeX), random(1,5,X), addFarming(X, TypeX),
    random(10,19,TypeY), random(1,4,Y), addFishing(Y, TypeY),
    random(40,43,TypeZ), random(1,4,Z), addRanching(Z, TypeZ).

questLevel(Level) :-
    Level =< 10, !,
    random(30,39,TypeX), random(1,8,X), addFarming(X, TypeX),
    random(10,19,TypeY), random(1,8,Y), addFishing(Y, TypeY),
    random(40,43,TypeZ), random(1,8,Z), addRanching(Z, TypeZ).

tasks :-
    game_start(1), !,
    \+ isQuestFinished, !,
    quest(X, TypeX, Y, TypeY, Z, TypeZ),
    write('TASKS : '),
    write('Here are the tasks that you need to do.\n'),
    write('You need to collect : \n'),
    format('- ~d ', [X]), writeTypePlant(TypeX),
    format('- ~d ', [Y]), writeTypeFish(TypeY),
    format('- ~d ', [Z]), writeTypeRanch(TypeZ).

tasks :-
    game_start(1), !,
    isQuestFinished, !,
    write('TASKS : '), nl,
    write('You do not have any tasks to complete!\n'), nl.

tasks :- 
    game_start(0), !,
    write('You have not started the game! \n'),
	write('Type \'start\' to start the game... \n').

farmCompleted:-
    quest(0,_,_,_,_,_), !, nl,
    write('TASKS COMPLETED!!!'), nl,
    write('You got some rewards!\n'),
    addExp(1).

fishCompleted:-
    quest(_,_,0,_,_,_), !, nl,
    write('TASKS COMPLETED!!!'), nl,
    write('You got some rewards!\n'),
    addExp(2).

ranchCompleted:-
    quest(_,_,_,_,0,_), !,  nl,
    write('TASKS COMPLETED!!!'), nl,
    write('You got some rewards!\n'),
    addExp(3).

questCompleted :-
    quest(0,_,0,_,0,_), nl,
    write('QUESTS COMPLETED!!!'), nl,
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    NGold is Gold + 200*Level,
    write('You got some rewards!\n'),
    format('Current Gold: ~d\n', [NGold]),
    retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
    asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, NGold)),
    (\+ checkGoalGold). 

finishQuest(_,_) :-
    isQuestFinished, !.

finishQuest(1, TypePlant) :-
    quest(TempX,TypeX,Y,TypeY,Z,TypeZ),
    TypePlant =:= TypeX, TempX > 0 -> (
        X is TempX - 1
    ),
    retract(quest(TempX,TypeX,Y,TypeY,Z,TypeZ)),
    asserta(quest(X, TypeX, Y, TypeY, Z, TypeZ)),
    farmCompleted, !,
    questCompleted, !.

finishQuest(2, TypeFish) :-
    quest(X,TypeX,TempY,TypeY,Z,TypeZ),
    TypeFish =:= TypeY, TempY > 0 -> (
        Y is TempY - 1
    ),
    retract(quest(X,TypeX,TempY,TypeY,Z,TypeZ)),
    asserta(quest(X,TypeX,Y,TypeY,Z,TypeZ)),
    addExp(2),
    fishCompleted, !,
    questCompleted, !.

finishQuest(3, TypeRanch) :-
    quest(X,TypeX,Y,TypeY,TempZ,TypeZ),
    TypeRanch =:= TypeZ, TempZ > 0 -> (
        Z is TempZ - 1
    ),
    retract(quest(X,TypeX,Y,TypeY,TempZ,TypeZ)),
    asserta(quest(X,TypeX,Y,TypeY,Z,TypeZ)),
    addExp(3),
    ranchCompleted, !,
    questCompleted, !.
