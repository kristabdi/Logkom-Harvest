/* File : Main.pl */
/* Main program */

startGame :-
    write(' _   _                           _   '), nl,
    write('| | | | __ _ _ ____   _____  ___| |_ '), nl,
    write("| |_| |/ _` | '__\ \ / / _ \/ __| __| "), nl,
    write('|  _  | (_| | |   \ V /  __/\__ \ |_ '), nl,
    write('|_| |_|\__,_|_|    \_/ \___||___/\__|'), nl,
    write(''), nl,
    write('Harvest Star!!!'), nl,
    write(''), nl,
    write("Let's play and pay our debts together!:"), nl,
    write(''), nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), nl,
    write('%                              ~Harvest Star~                                  %'), nl,
    write('% 1. start  : untuk memulai petualanganmu                                      %'), nl,
    write('% 2. map    : menampilkan peta                                                 %'), nl,
    write('% 3. status : menampilkan kondisimu terkini                                    %'), nl,
    write('% 4. w      : gerak ke utara 1 langkah                                         %'), nl,
    write('% 5. s      : gerak ke selatan 1 langkah                                       %'), nl,
    write('% 6. d      : gerak ke ke timur 1 langkah                                      %'), nl,
    write('% 7. a      : gerak ke barat 1 langkah                                         %'), nl,
    write('% 9. Status : menampilkan status pemain                                        %'), nl,
    write('% 8. help   : menampilkan segala bantuan                                       %'), nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), nl.

game_start(false).

read_job :- 
    repeat,
    write('Welcome to Harvest Star. Choose your job'), nl,
    write('1. Farmer'), nl,
    write('2. Fisherman'), nl,
    write('3. Rancher'), nl,
    read(JobNumber),
    (   playerChoose(Job).
        write(', let’s start! Good luck!'), nl, !
    ;   write('Not a valid choice, try again...'), nl, fail
    ).

start :-
    ['player.pl'],
    ['status.pl'],
    retract(game_start(false)), !,
    asserta(game_start(true)),

    read_job.