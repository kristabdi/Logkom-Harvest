/* File : Player.pl */
/* Store player information */

/* Set dynamc predicates */
:- dynamic(player/2).

/* Jenis job*/
job(1, Fisherman).
job(2, Farmer).
job(3, Rancher).

/* Player dan Level Awal */
player(Fisherman, 1).
player(Farmer, 1).
player(Farmer, 1).