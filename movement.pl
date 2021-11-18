%:- include('map.pl').
%:- include('time.pl').
%:- include('house.pl').

/* When player hit the fence perimeter */
hit_fence :-
    write('You hit the fence, check where you are on the map.\n'),
    map.

enter_house:-
    write('Do you wish to enter your house?'), nl,
    write('1. Yes'), nl,
    write('2. No'), nl,
    read(X),
    (
    X =:= 1 -> (
        house
    );
    X =:= 2 -> (
        !
    )
).

enter_ranch:-
    write('Do you wish to enter the ranch?'), nl,
    write('1. Yes'), nl,
    write('2. No'), nl,
    read(X),
    (
    X =:= 1 -> (
        ranch
        % ini mengarah ke function ranch nanti
    );
    X =:= 2 -> (
        !
    )
).

enter_market:-
    write('Do you wish to enter the marketplace?'), nl,
    write('1. Yes'), nl,
    write('2. No'), nl,
    read(X),
    (
    X =:= 1 -> (
        marketplace
        % ini mengarah ke function marketplace nanti
    );
    X =:= 2 -> (
        !
    )
).

enter_questing:-
    write('Do you wish to enter the questing area?'), nl,
    write('1. Yes'), nl,
    write('2. No'), nl,
    read(X),
    (
    X =:= 1 -> (
        questing
        % ini mengarah ke function questing nanti
    );
    X =:= 2 -> (
        !
    )
).

/* W movement, goes upwards */
% Enter House
w:-
    interiorObject(X, Y, 'P'),
    interiorObject(House_X, House_Y, 'H'),
    X =:= House_X, Y-1 =:= House_Y,
    enter_house.

% Enter Ranch
w:-
    interiorObject(X, Y, 'P'),
    interiorObject(Ranch_X, Ranch_Y, 'R'),
    X =:= Ranch_X, Y-1 =:= Ranch_Y,
    enter_ranch.

% Enter Marketplace
w:-
    interiorObject(X, Y, 'P'),
    interiorObject(Market_X, Market_Y, 'M'),
    X =:= Market_X, Y-1 =:= Market_Y,
    enter_market.

w:-
    interiorObject(X, Y, 'P'),
    interiorObject(Quest_X, Quest_Y, 'Q'),
    X =:= Quest_X, Y-1 =:= Quest_Y,
    enter_questing.

w:-
    interiorObject(X, Y, 'P'),
    NextWY is Y - 1,
    (\+ interiorObject(X, Y, '#')),
    map_size(_,H),
    NextWY > 0,
    NextWY < H-1, !,
    retract(interiorObject(X, Y, 'P')),
    assertz(interiorObject(X, NextWY, 'P')),
    add_time,
    map.

w:-
    hit_fence.

/* A movement, goes leftwards */
% Enter House
a:-
    interiorObject(X, Y, 'P'),
    interiorObject(House_X, House_Y, 'H'),
    X-1 =:= House_X, Y =:= House_Y,
    enter_house.

% Enter Ranch
a:-
    interiorObject(X, Y, 'P'),
    interiorObject(Ranch_X, Ranch_Y, 'R'),
    X-1 =:= Ranch_X, Y =:= Ranch_Y,
    enter_ranch.

% Enter Marketplace
a:-
    interiorObject(X, Y, 'P'),
    interiorObject(Market_X, Market_Y, 'M'),
    X-1 =:= Market_X, Y =:= Market_Y,
    enter_market.

a:-
    interiorObject(X, Y, 'P'),
    interiorObject(Quest_X, Quest_Y, 'Q'),
    X-1 =:= Quest_X, Y =:= Quest_Y,
    enter_questing.

a:-
    interiorObject(X, Y, 'P'),
    NextAX is X - 1,
    (\+ interiorObject(X, Y, '#')),
    map_size(W,_),
    NextAX > 0,
    NextAX < W-1, !,
    retract(interiorObject(X, Y, 'P')),
    assertz(interiorObject(NextAX, Y, 'P')),
    add_time,
    map.

a:-
    hit_fence.

/* S movement, goes downwards */
% Enter House
s:-
    interiorObject(X, Y, 'P'),
    interiorObject(House_X, House_Y, 'H'),
    X =:= House_X, Y+1 =:= House_Y,
    enter_house.

% Enter Ranch
s:-
    interiorObject(X, Y, 'P'),
    interiorObject(Ranch_X, Ranch_Y, 'R'),
    X =:= Ranch_X, Y+1 =:= Ranch_Y,
    enter_ranch.

% Enter Marketplace
s:-
    interiorObject(X, Y, 'P'),
    interiorObject(Market_X, Market_Y, 'M'),
    X =:= Market_X, Y+1 =:= Market_Y,
    enter_market.

s:-
    interiorObject(X, Y, 'P'),
    interiorObject(Quest_X, Quest_Y, 'Q'),
    X =:= Quest_X, Y+1 =:= Quest_Y,
    enter_questing.

s:-
    interiorObject(X, Y, 'P'),
    NextSY is Y + 1,
    (\+ interiorObject(X, Y, '#')),
    map_size(_,H),
    NextSY > 0,
    NextSY < H-1, !,
    retract(interiorObject(X, Y, 'P')),
    assertz(interiorObject(X, NextSY, 'P')),
    add_time,
    map.

s:-
    hit_fence.

/* D movement, goes rightwards */
% Enter House
d:-
    interiorObject(X, Y, 'P'),
    interiorObject(House_X, House_Y, 'H'),
    X+1 =:= House_X, Y =:= House_Y,
    enter_house.

% Enter Ranch
d:-
    interiorObject(X, Y, 'P'),
    interiorObject(Ranch_X, Ranch_Y, 'R'),
    X+1 =:= Ranch_X, Y =:= Ranch_Y,
    enter_ranch.

% Enter Marketplace
d:-
    interiorObject(X, Y, 'P'),
    interiorObject(Market_X, Market_Y, 'M'),
    X+1 =:= Market_X, Y =:= Market_Y,
    enter_market.

d:-
    interiorObject(X, Y, 'P'),
    interiorObject(Quest_X, Quest_Y, 'Q'),
    X+1 =:= Quest_X, Y =:= Quest_Y,
    enter_questing.

d:-
    interiorObject(X, Y, 'P'),
    NextDX is X + 1,
    (\+ interiorObject(X, Y, '#')),
    map_size(W,_),
    NextDX > 0,
    NextDX < W-1, !,
    retract(interiorObject(X, Y, 'P')),
    assertz(interiorObject(NextDX, Y, 'P')),
    add_time,
    map.

d:-
    hit_fence.
    