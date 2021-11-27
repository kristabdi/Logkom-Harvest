/* Set dynamc predicates */
:- dynamic(items_inventory/2).

/* Utility function for inserting items at end of list */
insert_back(X, [], [X]) :- !.
insert_back(X, [H|Tail1], [H|Tail2]):-insert_back(X,Tail1, Tail2).

/* Utility function for deleting nth items of the list */
delete_nth(1, [_|T], T) :- !.
delete_nth(N, [H|Tail1], [H|Tail2]) :- N1 is N-1, delete_nth(N1, Tail1, Tail2).

/* Utility function to get nth item of list */
nth_item([H|_],1, H) :- !.
nth_item([_|T],N, X) :- N1 is N-1, nth_item(T, N1, X).

/* Utility function to set nth item of list */
set_nth_item([_|T], 1, X, [X|T]).
set_nth_item([H|T1], N, X, [H|T2]):-N1 is N-1, set_nth_item(T1, N1, X, T2).


/* ------------------------------------------------------------------- */

/* Procedure to add items to inventory*/
insert_items(ItemsId) :- 
    items_inventory(ItemsList,ItemsCount),

    NewItemsCount is ItemsCount+1,
    insert_back(ItemsId, ItemsList, NewItemsList),

    assertz(items_inventory(NewItemsList, NewItemsCount)),
    retract(items_inventory(ItemsList, ItemsCount)), !.

/* Procedure to remove items from inventory */
delete_items(SlotId) :-
    items_inventory(PokeList,PokeCount),

    NewItemsCount is ItemsCount-1,
    delete_nth(SlotId, ItemsList, NewItemsList),

    assertz(items_inventory(NewItemsList, NewItemsCount)),
    retract(items_inventory(ItemsList, ItemsCount)), !.


/* Print nth slot status */
print_nth_slot(N):-
    items_inventory(ItemsList, _),
    nth_item(ItemsList, N, NthId),

    items_count(NthId, ItemsCount),
    items_name(NthId, ItemsName),
    write(ItemsCount), write(' '), write(ItemsName), nl.

/* Print all slot */
print_all_slot:-
    items_inventory(_, Count),
    Count > 0,
    !,
    write('Your Inventory:\n'),
    print_nth_slot(1),
    print_nth_slot(2),
    print_nth_slot(3),
    print_nth_slot(4),
    print_nth_slot(5),
    print_nth_slot(6).
    print_nth_slot(7).
    print_nth_slot(8).
    print_nth_slot(9).
    print_nth_slot(10).
    print_nth_slot(11).
    print_nth_slot(12).
    print_nth_slot(13).
    print_nth_slot(14).
    print_nth_slot(15).