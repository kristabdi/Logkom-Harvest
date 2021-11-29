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
    nl, nl,
    write('=========================================================================='), nl,
    write('# Harvest!!                                                              #'), nl, 
    write('# Harvest Star!!!                                                        #'), nl,
    write('#                                                                        #'), nl,
    write('# Let us play and pay our debts together                                 #'), nl,
    write('# Welcome to Harvest Star                                                #'), nl,
    write('#                                                                        #'), nl,
    write('# Please use the command \'help.\' to list all the available commands      #'), nl,
    write('# Enjoy the game!                                                        #'), nl,
    write('=========================================================================='), nl,

    addItem('Level 1 Hoe', 1),
    addItem('Level 1 Fishing Rod', 1),
    retract(game_start(_)),
    asserta(game_start(1)),
    read_job.
    


help:-
    write('Available Commands List:'), nl,
    write('1. start    : start your game'), nl,
    write('2. map      : show map'), nl,
    write('3. status   : show your player status, including exp level and current gold'), nl,
    write('Movement Commands:'), nl,
    write('4. w        : move 1 step upwards'), nl,
    write('5. a        : move 1 step leftwards'), nl,
    write('6. s        : move 1 step downwards'), nl,
    write('7. d        : move 1 step rightwards'), nl,
    write('Farming Commands:'), nl,
    write('8. dig      : dig a ground for planting'), nl,
    write('9. plant    : plant a seed inside a digged ground'), nl,
    write('10. harvest : harvest planted seed in the ground when the time is right'), nl,
    write('Ranching Commands:'), nl,
    write('11. cow     : check your cows'), nl,
    write('12. sheep   : check your sheep'), nl,
    write('13. goat    : check your goat'), nl,
    write('Inventory Commands:'), nl,
    write('14. inv      : show your full inventory'), nl,
    write('15. invSeed  : show your seed inventory'), nl,
    write('16. dropItem  : drop item from your inventory'), nl,
    write('Quest Commands:'), nl,
    write('17. tasks    : show your current active quest tasks'), nl,
    write('Other Commands:'), nl,
    write('18. time     : show current game time'), nl,
    write('19. help     : show this help menu'), nl.

quit :- 
    nl,nl,
    write('Game has ended. See you soon.') ,nl,nl,
    halt.