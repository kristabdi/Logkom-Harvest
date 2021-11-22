/* File : Player.pl */
/* Store player information */

/* Set dynamc predicates */
:- dynamic(player/9).
:- dynamic(game_start/1).


/* Create global level constant */
max_level(10).
game_start(0).

/* Player dan Level Awal */
player(1, 1, 1, 1, 1, 0, 0, 0, 0).
/* Job, Level, Farming Level, Fisherman Level, Ranching Level, EXP, EXP Farming, EXP FIshing, EXP Ranching */
/* Job : 1. Farming 
        2. Fisherman
        3. Ranching
*/

/* Jenis job*/
playerChoose(1) :-
    write('You choose Farmer'),
    retract(player(_, _, _, _, _, _, _, _, _)),
    retract(game_start(_)),
    asserta(player(1, 1, 1, 1, 0, 0, 0, 0)),
    asserta(game_start(1)).

playerChoose(2) :-
    write('You choose Fisherman'),
    retract(player(_, _, _, _, _, _, _, _, _)),
    retract(game_start(_)),
    asserta(player(2, 1, 1, 1, 0, 0, 0, 0)),
    asserta(game_start(1)).

playerChoose(3) :-
    write('You choose Rancher'),
    retract(player(_, _, _, _, _, _, _, _, _)),
    retract(game_start(_)),
    asserta(player(3, 1, 1, 1, 0, 0, 0, 0)),
    asserta(game_start(1)).

addLevel:-
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('             █░░ █▀▀ █░█ █▀▀ █░░   █░█ █▀█ █   \n'),
    write('             █▄▄ ██▄ ▀▄▀ ██▄ █▄▄   █▄█ █▀▀ ▄   \n'),
    write('                                               \n'),
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    Level_Now is Level + 1,
    retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
    asserta(player(Role, Level_Now, Level_Now, Level_Now, Level_Now, 0, 0, 0, 0)).


addExp(X) :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    Role =:= 1, !,
    (
    X =:= 1 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPFarm is EXPFarm + 6,
        NewEXP is (NewEXPFarm + EXPFish + EXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, NewEXPFarm, EXPFish, EXPRanch)),checkLevelUp(_),!
    )
    ;
    X =:= 2 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPFish is EXPFish + 3,
        NewEXP is (EXPFarm + NewEXPFish + EXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, NewEXPFish, EXPRanch)),checkLevelUp(_),!
    )
    ;
    X =:= 3 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPRanch is EXPRanch + 3,
        NewEXP is (EXPFarm + EXPFish + NewEXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, EXPFish, NewEXPRanch)),checkLevelUp(_),!
    )
).

addExp(X) :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    Role =:= 2, !,
    (
    X =:= 1 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPFarm is EXPFarm + 3,
        NewEXP is (NewEXPFarm + EXPFish + EXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, NewEXPFarm, EXPFish, EXPRanch)),checkLevelUp(_),!
    )
    ;
    X =:= 2 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPFish is EXPFish + 6,
        NewEXP is (EXPFarm + NewEXPFish + EXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, NewEXPFish, EXPRanch)),checkLevelUp(_),!
    )
    ;
    X =:= 3 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPRanch is EXPRanch + 3,
        NewEXP is (EXPFarm + EXPFish + NewEXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, EXPFish, NewEXPRanch)),checkLevelUp(_),!
    )
).

addExp(X) :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    Role =:= 3, !,
    (
    X =:= 1 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPFarm is EXPFarm + 3,
        NewEXP is (NewEXPFarm + EXPFish + EXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, NewEXPFarm, EXPFish, EXPRanch)),checkLevelUp(_),!
    )
    ;
    X =:= 2 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPFish is EXPFish + 3,
        NewEXP is (EXPFarm + NewEXPFish + EXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, NewEXPFish, EXPRanch)),checkLevelUp(_),!
    )
    ;
    X =:= 3 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewEXPRanch is EXPRanch + 6,
        NewEXP is (EXPFarm + EXPFish + NewEXPRanch)/3,
        asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, NewEXP, EXPFarm, EXPFish, NewEXPRanch)),checkLevelUp(_),!
    )
).

checkLevelUp(0) :-
    player(_, Level, _, _, _, EXP, _, _, _),
    Exp < Lvl * 100, !.

checkLevelUp(1) :-
    player(_, Level, _, _, _, EXP, _, _, _),
    EXP >= Level * 100,
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
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    write('█▀ ▀█▀ ▄▀█ ▀█▀ █░█ █▀\n'),
    write('▄█ ░█░ █▀█ ░█░ █▄█ ▄█\n'), nl, nl,
    write('Your status: '),
    writejob(Role), nl,
    format('Level: ~d', [Level]), nl,
    format('Level farming: ~d', [FarmLevel]), nl,
    format('Exp farming: ~d', [EXPFarm]), nl,
    format('Level fishing: ~d', [FishLevel]), nl,
    format('Exp fishing: ~d', [EXPFarm]), nl,
    format('Level ranching: ~d', [RanchLevel]), nl,
    format('Exp ranching: ~d', [EXPRanch]), nl,
    MaxExp is Level*100,
    format('Exp: ~d/~d\n', [Exp, MaxExp]),
    format('Gold: ~d', [Gold]), nl.

status :-
    game_start(0), ! ,
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n').