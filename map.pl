/* interiorObject(X, Y, Object) is Object at position (X,Y) */

/* Setup dynamic predicate */
:- dynamic(interiorObject/3).
:- dynamic(tilledGround/4).

/* MAP SIZE (with fences) */
map_size(17,17).

/* RIVER SETUP */
interiorObject(1, 7, 'o').
interiorObject(1, 8, 'o').
interiorObject(1, 9, 'o').
interiorObject(2, 7, 'o').
interiorObject(2, 8, 'o').
interiorObject(2, 9, 'o').
interiorObject(3, 7, 'o').
interiorObject(3, 8, 'o').
interiorObject(3, 9, 'o').

interiorObject(6, 7, 'o').
interiorObject(6, 8, 'o').
interiorObject(6, 9, 'o').
interiorObject(7, 7, 'o').
interiorObject(7, 8, 'o').
interiorObject(7, 9, 'o').
interiorObject(8, 7, 'o').
interiorObject(8, 8, 'o').
interiorObject(8, 9, 'o').
interiorObject(9, 7, 'o').
interiorObject(9, 8, 'o').
interiorObject(9, 9, 'o').
interiorObject(10, 7, 'o').
interiorObject(10, 8, 'o').
interiorObject(10, 9, 'o').

interiorObject(13, 7, 'o').
interiorObject(13, 8, 'o').
interiorObject(13, 9, 'o').
interiorObject(14, 7, 'o').
interiorObject(14, 8, 'o').
interiorObject(14, 9, 'o').
interiorObject(15, 7, 'o').
interiorObject(15, 8, 'o').
interiorObject(15, 9, 'o').

/* Setup buildings -> 
   - H -> House
   - R -> Ranch
   - M -> Marketplace 
   - Q -> Questing Place */
interiorObject(2, 5, 'H').
interiorObject(13, 3, 'R').
interiorObject(8, 12, 'M').
interiorObject(12, 13, 'Q').

/* Setup player position */
interiorObject(2, 2, 'P').

/* Setup tilled land */
tilledGround(1, 0, 0, '=').
tilledGround(2, 0, 0, '=').
tilledGround(3, 0, 0, '=').
tilledGround(4, 0, 0, '=').
tilledGround(5, 0, 0, '=').
tilledGround(6, 0, 0, '=').
tilledGround(7, 0, 0, '=').
tilledGround(8, 0, 0, '=').
tilledGround(9, 0, 0, '=').
tilledGround(10, 0, 0,'=').
tilledGround(11, 0, 0, '=').
tilledGround(12, 0, 0, '=').
tilledGround(13, 0, 0, '=').
tilledGround(14, 0, 0, '=').
tilledGround(15, 0, 0, '=').
/* Map command */
map :- 
    print_map.

/* Start iteration */
print_map :-
    print_point(0,0).

/* print_point(X,Y) akan iterasi naik sampai nabrak map_size */
/* Print outside fences */
/* Left Fence */
print_point(X, Y) :-
    map_size(W,H),
    Y < H,
    X =:= W - 1,
    write('# '), nl,
    NextLY is Y + 1,
    print_point(0,NextLY).

/* Right Fence */
print_point(X, Y) :-
    map_size(_,H),
    Y < H,
    X =:= 0,
    write('# '),
    NextLX is X + 1,
    print_point(NextLX,Y).

/* Top Fence */
print_point(X, Y) :-
    map_size(W,_),
    X < W-1,
    X > 0,
    Y =:= 0,
    write('# '),
    NextTX is X + 1,
    print_point(NextTX,Y).

/* Bottom Fence */
print_point(X, Y) :-
    map_size(W,H),
    X < W-1,
    X > 0,
    Y =:= H-1,
    write('# '),
    NextBX is X + 1,
    print_point(NextBX,Y).

/* Print Interior (Player) */
print_point(X, Y) :-
    map_size(W,H),
    X > 0,
    X < W,
    Y > 0,
    Y < H,
    interiorObject(X,Y,'P'), !,
    write('P '),
    NextInteriorX is X + 1,
    print_point(NextInteriorX, Y).

/* Print Interior (Other Objects) */
print_point(X, Y) :-
    map_size(W,H),
    X > 0,
    X < W,
    Y > 0,
    Y < H,
    interiorObject(X,Y,Object), !,
    write(Object),
    write(' '),
    NextOtherX is X + 1,
    print_point(NextOtherX, Y).

/* Print Tilled Land */
print_point(X, Y) :-
    map_size(W,H),
    X < W-1,
    X > 0,
    Y < H-1,
    Y > 0,
    tilledGround(_, X, Y, '='), !,
    write('= '),
    NextTilledX is X + 1,
    print_point(NextTilledX, Y).

/* Print Interior (Empty tile) */
print_point(X, Y) :-
    map_size(W,H),
    X < W-1,
    X > 0,
    Y < H-1,
    Y > 0,
    (\+ interiorObject(X, Y, _)),
    write('- '),
    NextEmptyX is X + 1,
    print_point(NextEmptyX, Y).