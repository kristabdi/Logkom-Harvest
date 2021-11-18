/* File : Player.pl */
/* Store player information */

/* Set dynamc predicates */
:- dynamic(playerstats/2).
:- dynamic(current_level(1)).
:- dynamic(current_farmlevel(1)).
:- dynamic(current_fishlevel(1)).
:- dynamic(current_ranchlevel(1)).
:- dynamic(current_exp(1)).
:- dynamic(current_farmexp(1)).
:- dynamic(current_fishexp(1)).
:- dynamic(current_ranchexp(1)).

/* Create global level constant */
current_level(1).
max_level(10).

/* Jenis job*/
job(1, Fisherman).
job(2, Farmer).
job(3, Rancher).

/* Player dan Level Awal */
playerstats(Farmer, 1).
current_level(1).
current_farmlevel(1).
current_fishlevel(1).
current_ranchlevel(1).
current_exp(1).
current_farmexp(1).
current_fishexp(1).
current_ranchexp(1).

add_level:-
    current_level(X),
    Level_Now is X + 1,
    retract(current_level(X)),
    assertz(current_time(Level_Now)).


