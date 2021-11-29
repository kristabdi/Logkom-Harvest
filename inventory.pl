/* Deklarasi predikat inventory() sebagai dynamic */
/* inventory(X) berarti player memiliki inventory X yang berisi nama dan jumlah item */
:- dynamic(inventory/1).
:- dynamic(itemIn/1).

inventory(_).
itemIn(0).

/* Menuliskan isi inventory pada layar */
inv :-  inventory(Inv), itemCount(Inv, Total), write('Your Inventory : ('), write(Total), write('/100)'), nl, printInventory(Inv).

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
        write(Count), write(' '), write(Name), write(' (Id = '), write(Id), write(')'), nl, printInventorySeed(T)
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
dropItem :-
    write('What do you want to drop?'), nl,
    inv,
    write('>'), read(X),
    write('How many do you want to drop?'), nl,
    write('>'), read(Y),
    drop(X,Y).
    
drop(_, Count) :- Count =< 0, !, write('Item count must be more than 0'), fail.
drop(Item, Count) :-
    inventory(Inv),
    (member([Item, CountInv], Inv) ->
        (CountInv > Count ->
            NewCount is CountInv - Count,
            delete(Inv, [Item, CountInv], TempInv),
            append(TempInv, [[Item, NewCount]], NewInv),
            retract(inventory(Inv)),
            assertz(inventory(NewInv)),
            retract(itemIn(_)),
            assertz(itemIn(1))
        ; CountInv =:= Count ->
            delete(Inv, [Item, CountInv], NewInv),
            retract(inventory(Inv)),
            assertz(inventory(NewInv)),
            retract(itemIn(_)),
            assertz(itemIn(1))
        ;
            write('You do not have that many item in your inventory'),
            retract(itemIn(_)),
            assertz(itemIn(1))
        )
    ;
        write('You do not have that item in your inventory'),
        retract(itemIn(_)),
        assertz(itemIn(0))
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
isInInventory(Id) :-
    item(Item,Id, _),
    inventory(Inv),
    member([Item, _], Inv).

isFull :-
    inventory(Inv), itemCount(Inv, Total),
    Total =:= 100.

isFullIfAdd(Plus) :-
    inventory(Inv), itemCount(Inv, Total),
    Total + Plus >= 100.