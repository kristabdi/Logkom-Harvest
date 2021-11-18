/* Setup dynamic predicate */
:- dynamic(current_time/1).

/* Create global time constant */
% 0 means early in the morning, 6:00
current_time(0).
start_time(0).

% 24 hour world
time_in_minutes(1440).

/* Tasks duration in minutes */
walking_time(30).

/* Current time */
add_time:-
    current_time(X),
    walking_time(Y),
    Time_Now is X + Y,
    retract(current_time(X)),
    assertz(current_time(Time_Now)).

reset_time:-
    current_time(X),
    start_time(Y),
    retract(current_time(X)),
    assertz(current_time(Y)).