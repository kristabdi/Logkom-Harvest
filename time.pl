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

farm_counter(1).
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
        %checkGoalTime
        );
    X + Y =:= Limit -> (
        DayUpdate is CurrentDay + 1,
        retract(days_count(CurrentDay)),
        assertz(days_count(DayUpdate)),
        reset_time
        %checkGoalTime
        );
    X + Y < Limit -> (
        Time_Now is X + Y,
        retract(current_time(X)),
        assertz(current_time(Time_Now))
        %checkGoalTime
        )
    ).  

reset_time:-
    farm_counter(Counter),
    current_time(X),
    start_time(Y),
    retract(current_time(X)),
    assertz(current_time(Y)),
    days_count(CurrentDay),
    NextDay is CurrentDay + 1,
    retract(days_count(_)),
    assertz(days_count(NextDay)),
    (\+ updateFarm(Counter)),
    updateRanch.
    %checkGoalTime.

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

checkGoalTime :- 
    days_count(Days),
    % If 1 year passed and still not 20000 gold
    Days > 365 -> (
        \+ checkGoalGold, !,
        write('GAME OVER!'), nl,
        write('You did not manage to collect more than 20000 Gold under one year.') , nl,
        write('GAME OVER!') ,nl,
        quit
    )
    ;
    Days < 365 -> (
        !
    ).