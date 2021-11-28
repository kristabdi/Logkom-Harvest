/* include modul lain */
:- include('items.pl').

/* Deklarasi predikat inventory() sebagai dynamic */
/* inventory(X) berarti player memiliki inventory X yang berisi nama dan jumlah item */
:- dynamic(inventory/1).

inventory(Inv).

/* Menuliskan isi inventory pada layar */
inv :-  inventory(Inv), printInventory(Inv).

printInventory([]) :- !.

printInventory([[Name, Count]|T]) :-
    write(Count), write(' '), write(Name), nl,
    printInventory(T).

/* Menuliskan isi inventory yang tipenya seed pada layar */
invSeed :- inventory(Inv), printInventorySeed(Inv).

printInventorySeed([]) :- !.

printInventorySeed([[Name, Count]|T]) :-
    item(Name, Id, _),
    ( Id > 19 , Id < 30 ->
        write(Count), write(' '), write(Name), nl, printInventorySeed(T)
    ; Id < 20 ->
        printInventorySeed(T)
    ; Id > 29 ->
        printInventorySeed(T)
    ).
    

/* itemCount(X, Y) berarti dalam inventory X terdapat Y item */
itemCount([], 0).
itemCount([[_, Count]|T], Total) :-
    itemCount(T, Temp),
    Total is Count + Temp.

/* drop(X, Y) membuang X sebanyak Y dari inventory jika ada */
drop(Item) :- drop(Item, 1).
drop(_, Count) :- Count =< 0, !, write('Item count must be more than 0'), fail.
drop(Item, Count) :-
    inventory(Inv),
    (member([Item, CountInv], Inv) ->
        (CountInv > Count ->
            NewCount is CountInv - Count,
            delete(Inv, [Item, CountInv], TempInv),
            append(TempInv, [[Item, NewCount]], NewInv),
            retract(inventory(Inv)),
            assertz(inventory(NewInv))
        ; CountInv =:= Count ->
            delete(Inv, [Item, CountInv], NewInv),
            retract(inventory(Inv)),
            assertz(inventory(NewInv))
        ;
            write('You do not have that many item in your inventory')
        )
    ;
        write('You do not have that item in your inventory')
    ).
     
/* addItem(X, Y) menambahkan X sebanyak Y ke dalam inventory */
addItem(_, Count) :- Count =< 0, !, write('Item count must be more than 0'), fail.
addItem(Item, Count) :-
    item(Item, _, _),
    inventory(Inv),
    itemCount(Inv, IC),
    (Count + IC =< 100 ->
        (member([Item, CountInv], Inv) ->
            NewCount is CountInv + Count,
            delete(Inv, [Item, CountInv], TempInv),
            append(TempInv, [[Item, NewCount]], NewInv),
            retract(inventory(Inv)),
            assertz(inventory(NewInv))
        ;
            append(Inv, [[Item, Count]], NewInv),
            retract(inventory(Inv)),
            assertz(inventory(NewInv))
        )
    ;
        write('Failed to add item, inventory full')
    ).

/* Mengecek apakah item ada di inventory */
isInInventory(Item) :-
    item(Item, _, _),
    inventory(Inv),
    itemCount(Inv, IC),
    member([Item, CountInv], Inv).
