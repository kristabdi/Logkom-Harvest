/* File : Main.pl */
/* Main program */

read_job :- 
    repeat,
    write('Welcome to Harvest Star. Choose your job'), nl,
    write('1. Farmer'), nl,
    write('2. Fisherman'), nl,
    write('3. Rancher'), nl,
    read(JobNumber),
    playerChoose(JobNumber),
    write(', lets start! Good luck!'), nl.

start:-
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
    ['quest.pl'],
    write('Harvest!!'), nl, 
    write('Harvest Star!!!'), nl,
    write(''), nl,
    write('Let us play and pay our debts together'), nl,
    write('Welcome to Harvest Star'), nl,
    write(''), nl,
    write('Please use the command \'help.\' to list all the available commands'), nl,
    write('Enjoy the game!'),
    
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
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), nl,

    retract(game_start(_)),
    asserta(game_start(1)),
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
    write('Ranching Commands:'), nl,
    write('10. cow   : check your cows'), nl,
    write('11. sheep : check your sheep'), nl,
    write('12. goat  : check your goat'), nl,
    write('Other Commands:'), nl,
    write('8. help   : show this help menu'), nl.

quit :- 
    nl,nl,
    write('Game has ended. See you soon.') ,nl,nl,
    halt.