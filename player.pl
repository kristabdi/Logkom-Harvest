/* File : Player.pl */
/* Store player information */

/* Set dynamc predicates */
:- dynamic(player/9).

/* Create global level constant */
max_level(10).

/* Jenis job*/
playerChoose(1) :-
    write('You choose Farmer'),
    assertz(player(1, 1, 1, 1, 0, 0, 0, 0).
    asserta(started(1)),
    initPlayer(1).

playerChoose(2) :-
    write('You choose Fisherman'),
    assertz(player(2, 1, 1, 1, 0, 0, 0, 0).
    asserta(started(1)),
    initPlayer(2).

playerChoose(3) :-
    write('You choose Rancher'),
    assertz(player(3, 1, 1, 1, 0, 0, 0, 0).
    asserta(started(1)),
    initPlayer(3).

/* Player dan Level Awal */
player(1, 1, 1, 1, 1, 0, 0, 0, 0).
/* Job, Level, Farming Level, Fisherman Level, Ranching Level, EXP, EXP Farming, EXP FIshing, EXP Ranching */
/* Job : 1. Farming 
        2. Fisherman
        3. Ranching
*/


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
    Level_Now is X + 1,
    retract(player(Role, Level_Now, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
    asserta(player(Role, Level_Now, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)), !.

addFarmLevel:-
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('             █░░ █▀▀ █░█ █▀▀ █░░   █░█ █▀█ █   \n'),
    write('             █▄▄ ██▄ ▀▄▀ ██▄ █▄▄   █▄█ █▀▀ ▄   \n'),
    write('                                               \n'),
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    Level_Now is X + 1,
    retract(player(Role, Level, Level_Now, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
    asserta(player(Role, Level, Level_Now, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)), !.

addFishLevel:-
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('             █░░ █▀▀ █░█ █▀▀ █░░   █░█ █▀█ █   \n'),
    write('             █▄▄ ██▄ ▀▄▀ ██▄ █▄▄   █▄█ █▀▀ ▄   \n'),
    write('                                               \n'),
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    Level_Now is X + 1,
    retract(player(Role, Level, FarmLevel, Level_Now, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
    asserta(player(Role, Level, FarmLevel, Level_Now, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)), !.

addRanchLevel:-
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('                                               \n'),
    write('             █░░ █▀▀ █░█ █▀▀ █░░   █░█ █▀█ █   \n'),
    write('             █▄▄ ██▄ ▀▄▀ ██▄ █▄▄   █▄█ █▀▀ ▄   \n'),
    write('                                               \n'),
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    Level_Now is X + 1,
    retract(player(Role, Level, FarmLevel, FishLevel, Level_Now, EXP, EXPFarm, EXPFish, EXPRanch)),
    asserta(player(Role, Level, FarmLevel, FishLevel, Level_Now, EXP, EXPFarm, EXPFish, EXPRanch)), !.
/%
addExp(X) :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    X = 1 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewExp is Exp + X,
        asserta(player(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),checkLevelUp(_),!.
    )
    ;
    X = 2 -> (
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
        NewExp is Exp + X,
        asserta(player(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),checkLevelUp(_),!.
    )
    ;
    (
        
    ).
    

addExp :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
    
    NewExp is Exp + X,
    asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),checkLevelUp(_),!.

addExp :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch),
    retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),
    NewExp is Exp + X,
    asserta(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch)),checkLevelUp(_),!.
%/
checkLevelUp(0) :-
    player(_, Level, _, _, _, EXP, _, _, _),
    Exp < Lvl * 100, !.

checkLevelUp(1) :-
    player(_, Level, _, _, _, EXP, _, _, _),
    EXP >= Level * 100,
    levelUp, !.