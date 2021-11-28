/* File : Player.pl */
/* Store player information */

/* Set dynamc predicates */
:- dynamic(player/10).
:- dynamic(game_start/1).


/* Create global level constant */
game_start(0).

/* Player dan Level Awal */
player(1, 1, 1, 1, 1, 0, 0, 0, 0, 2000).
/* Job, Level, Farming Level, Fisherman Level, Ranching Level, EXP, EXP Farming, EXP FIshing, EXP Ranching */
/* Job : 1. Farming 
        2. Fisherman
        3. Ranching
*/

/* Jenis job*/
playerChoose(1) :-
    write('You choose Farmer'),
    retract(player(_, _, _, _, _, _, _, _, _, _)),
    retract(game_start(_)),
    asserta(player(1, 1, 1, 1, 0, 0, 0, 0, 2000)),
    asserta(game_start(1)).

playerChoose(2) :-
    write('You choose Fisherman'),
    retract(player(_, _, _, _, _, _, _, _, _, _)),
    retract(game_start(_)),
    asserta(player(2, 1, 1, 1, 0, 0, 0, 0, 2000)),
    asserta(game_start(1)).

playerChoose(3) :-
    write('You choose Rancher'),
    retract(player(_, _, _, _, _, _, _, _, _,_)),
    retract(game_start(_)),
    asserta(player(3, 1, 1, 1, 0, 0, 0, 0, 2000)),
    asserta(game_start(1)).

addLevel:-
    write('█░░ █▀▀ █░█ █▀▀ █░░   █░█ █▀█ █ \n'),
    write('█▄▄ ██▄ ▀▄▀ ██▄ █▄▄   █▄█ █▀▀ ▄ \n'),
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    Level_Now is Level + 1,
    Gold_Now is Gold + Level*50,
    retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
    asserta(player(Role, Level_Now, Level_Now, Level_Now, Level_Now, 0, 0, 0, Gold_Now)).


addExp(X) :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    Role =:= 1, !,
    (
    X =:= 1 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPFarm is EXPFarm + 6,
        NewEXP is (NewEXPFarm + EXPFish + EXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 6 EXP for Farming EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, NewEXPFarm, EXPFish, EXPRanch, Gold)),checkLevelUp(_),!
    )
    ;
    X =:= 2 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPFish is EXPFish + 3,
        NewEXP is (EXPFarm + NewEXPFish + EXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 3 EXP for Fishing EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, NewEXPFish, EXPRanch, Gold)),checkLevelUp(_),!
    )
    ;
    X =:= 3 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPRanch is EXPRanch + 3,
        NewEXP is (EXPFarm + EXPFish + NewEXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 3 EXP for Ranching EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, EXPFish, NewEXPRanch, Gold)),checkLevelUp(_),!
    )
).

addExp(X) :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    Role =:= 2, !,
    (
    X =:= 1 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPFarm is EXPFarm + 3,
        NewEXP is (NewEXPFarm + EXPFish + EXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 3 EXP for Farming EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, NewEXPFarm, EXPFish, EXPRanch, Gold)),checkLevelUp(_),!
    )
    ;
    X =:= 2 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPFish is EXPFish + 6,
        NewEXP is (EXPFarm + NewEXPFish + EXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 6 EXP for Fishing EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, NewEXPFish, EXPRanch, Gold)),checkLevelUp(_),!
    )
    ;
    X =:= 3 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPRanch is EXPRanch + 3,
        NewEXP is (EXPFarm + EXPFish + NewEXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 3 EXP for Ranching EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, EXPFish, NewEXPRanch, Gold)),checkLevelUp(_),!
    )
).

addExp(X) :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    Role =:= 3, !,
    (
    X =:= 1 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPFarm is EXPFarm + 3,
        NewEXP is (NewEXPFarm + EXPFish + EXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 3 EXP for Farming EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, NewEXPFarm, EXPFish, EXPRanch, Gold)),checkLevelUp(_),!
    )
    ;
    X =:= 2 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPFish is EXPFish + 3,
        NewEXP is (EXPFarm + NewEXPFish + EXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 3 EXP for Fishing EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, NewEXPFish, EXPRanch, Gold)),checkLevelUp(_),!
    )
    ;
    X =:= 3 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        NewEXPRanch is EXPRanch + 6,
        NewEXP is (EXPFarm + EXPFish + NewEXPRanch)/3,
        GainedExp is NewEXP - EXP,
        write('You gained 6 EXP for Ranching EXP'), nl,
        write('You gained ~d EXP for EXP', [GainedExp]), nl,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, EXPFish, NewEXPRanch, Gold)),checkLevelUp(_),!
    )
).

checkLevelUp(0) :-
    player(_, Level, _, _, _, EXP, _, _, _, _),
    Exp < Lvl * 100, !.

checkLevelUp(1) :-
    player(_, Level, _, _, _, EXP, _, _, _, _),
    EXP >= Level * 100,
    Level < 10,
    addLevel, !.

writejob(X) :-
    X=:=1, !,
    write('Farmer').

writejob(X) :-
    X =:= 2, !,
    write('Fisherman').

writejob(X) :-
    X =:= 3, !,
    write('Rancher').

status :-
    game_start(1), !,
    write('anjing rila 7'),
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    write('anjing rila 8'),
    write('█▀ ▀█▀ ▄▀█ ▀█▀ █░█ █▀\n'),
    write('▄█ ░█░ █▀█ ░█░ █▄█ ▄█\n'), nl, nl,
    write('anjing rila 9'),
    write('Your status: '),
    write('anjing rila 11'),
    writejob(Role), nl,
    write('anjing rila 12'),
    format('Level: ~d', [Level]), nl,
    write('anjing rila 13'),
    format('Level farming: ~d', [FarmLevel]), nl,
    write('anjing rila 14'),
    format('Exp farming: ~d', [EXPFarm]), nl,
    write('anjing rila 15'),
    format('Level fishing: ~d', [FishLevel]), nl,
    write('anjing rila 16'),
    format('Exp fishing: ~d', [EXPFarm]), nl,
    write('anjing rila 17'),
    format('Level ranching: ~d', [RanchLevel]), nl,
    write('anjing rila 18'),
    format('Exp ranching: ~d', [EXPRanch]), nl,
    write('anjing rila 19'),
    MaxExp is Level*100,
    format('Exp: ~d/~d\n', [Exp, MaxExp]),
    write('anjing rila 20'),
    format('Gold: ~d', [Gold]), nl.

status :-
    game_start(0), ! ,
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n').