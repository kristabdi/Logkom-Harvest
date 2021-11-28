/* Setup dynamic predicate */
:- dynamic(current_time/1).
:- dynamic(days_count/1).

/* Create global time constant */
% 0 means early in the morning, 6:00
current_time(0).
start_time(0).

% 24 hour world
time_in_minutes(1440).

% How many days have passed
days_count(0).

/* Tasks duration in minutes */
walking_time(30).

/* Current time */
add_time:-
    current_time(X),
    walking_time(Y),
    days_count(CurrentDay),
    time_in_minutes(Limit),
    (
    X + Y > Limit -> (
        DayUpdate is CurrentDay + 1,
        retract(days_count(CurrentDay)),
        assertz(days_count(DayUpdate)),
        MinutesUpdate is Limit - X,
        retract(current_time(X)),
        assertz(current_time(MinutesUpdate)),
        updateFarm,
        updateRanch
        );
    X + Y =:= Limit -> (
        DayUpdate is CurrentDay + 1,
        retract(days_count(CurrentDay)),
        assertz(days_count(DayUpdate)),
        reset_time
        );
    X + Y < Limit -> (
        Time_Now is X + Y,
        retract(current_time(X)),
        assertz(current_time(Time_Now))
        )
    ).  

reset_time:-
    current_time(X),
    start_time(Y),
    retract(current_time(X)),
    assertz(current_time(Y)),
    days_count(CurrentDay),
    NextDay is CurrentDay + 1,
    retract(days_count(_)),
    assertz(days_count(NextDay)),
    updateFarm,
    updateRanch.

/* Time checking and reset minutes */

/* Display time */
time:-
    days_count(Days),
    current_time(Minutes),
    write('You have been playing for '),
    write(Days),
    write(' Days and '),
    write(Minutes),
    write(' Minutes.').
