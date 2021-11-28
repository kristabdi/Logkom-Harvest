/* File : Main.pl */
/* Main program */
startGame :-
    ['diary.pl'],
    ['farm.pl'],
    ['fishing.pl'],
    ['house.pl'],
    ['inventory.pl'],
    ['items.pl'],
    ['map.pl'],
    ['marketplace.pl'],
    ['movement.pl'],
    ['player.pl'],
    ['ranch.pl'],
    ['time.pl'],
    /* Ini ga jalan
    write(' _   _                           _   '), nl,
    write('| | | | __ _ _ ____   _____  ___| |_ '), nl,
    print('| |_| |/ _` |  __\ \ / / _ \/ __| __|'), nl,
    write('|  _  | (_| | |   \ V /  __/\__ \ |_ '), nl,
    write('|_| |_|\__,_|_|    \_/ \___||___/\__|'), nl, */
    write('Harvest!!'), nl, 
    write(''), nl,
    write('Harvest Star!!!'), nl,
    write(''), nl,
    write('Let us play and pay our debts together'), nl,
    write(''), nl,
    write('Welcome to Harvest Star'), nl,
    write(''), nl,
    write('Please use the command \'help.\' to list all the available commands'), nl,
    write(''), nl,
    write('Enjoy the game!').
    
    /*
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), nl,
    write('%                              ~Harvest Star~                                  %'), nl,
    write('% 1. start  : start your game                                                  %'), nl,
    write('% 2. map    : show map                                                         %'), nl,
    write('% 3. status : show your current condition                                      %'), nl,
    write('% 4. w      : move 1 step upwards                                              %'), nl,
    write('% 5. a      : move 1 step leftwards                                            %'), nl,
    write('% 6. s      : move 1 step downwards                                            %'), nl,
    write('% 7. d      : move 1 step rightwards                                           %'), nl,
    write('% 8. help   : show this help menu                                              %'), nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), nl. */



read_job :- 
    repeat,
    write('Welcome to Harvest Star. Choose your job'), nl,
    write('1. Farmer'), nl,
    write('2. Fisherman'), nl,
    write('3. Rancher'), nl,
    read(JobNumber),
    (   playerChoose(JobNumber),
        write(', let’s start! Good luck!'), nl, !
    ;   write('Not a valid choice, try again...'), nl, fail
    ).

start :-
    ['player.pl'],
    retract(game_start(false)), !,
    asserta(game_start(true)),

    read_job.

help:-
    write('Available Commands List:'), nl,
    write('1. start  : start your game'), nl,
    write('2. map    : show map'), nl,
    write('3. status : show your current condition'), nl,
    write('Movement Commands:'), nl,
    write('4. w      : move 1 step upwards'), nl,
    write('5. a      : move 1 step leftwards'), nl,
    write('6. s      : move 1 step downwards'), nl,
    write('7. d      : move 1 step rightwards'), nl,
    write('Farming Commands:'), nl,
    write('8. dig    : dig a ground for planting'), nl,
    write('9. plant  : plant a seed inside a digged ground'), nl,
    write('Other Commands:'), nl,
    write('8. help   : show this help menu'), nl.
