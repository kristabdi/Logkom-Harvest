/* Masuk store */
marketplace :- game_start(0),!, write('The game has not started, type "start." to play the game').
marketplace :-
    write('What do you want to do?'), nl,
    write('1. Buy'), nl,
    write('2. Sell'), nl,
    write('3. Exit'), nl,
    write('>'), read(X),
    (X == 1 -> buy
    ; X == 2 -> sell
    ; X == 3 -> exitStore
    ).

buy :-
    write('What do you want to buy?'), nl,
    write('1. Equipment'), nl,
    write('2. Seed'), nl,
    write('3. Animal'), nl,
    write('4. Exit'), nl,
    write('>'), read(X),
    (X == 1 -> buyEquipment
    ; X == 2 -> buySeed
    ; X == 3 -> buyAnimal
    ; X == 4 -> exitStore
    ).

buyEquipment :-
    write('What do you want to buy?'), nl,
    write('1. Level 2 Hoe (5000)'), nl,
    write('2. Level 3 Hoe (7000)'), nl,
    write('3. Level 4 Hoe (9000)'), nl,
    write('4. Level 5 Hoe (11000)'), nl,
    write('5. Level 2 Fishing Rod (5000)'), nl,
    write('6. Level 3 Fishing Rod (7000)'), nl,
    write('7. Level 4 Fishing Rod (9000)'), nl,
    write('8. Level 5 Fishing Rod (11000)'), nl,
    write('9. Exit'), nl,
    write('>'), read(X),
    (X == 1 -> buyEq('Level 2 Hoe')
    ; X == 2 -> buyEq('Level 3 Hoe')
    ; X == 3 -> buyEq('Level 4 Hoe')
    ; X == 4 -> buyEq('Level 5 Hoe')
    ; X == 5 -> buyEq('Level 2 Fishing Rod')
    ; X == 6 -> buyEq('Level 3 Fishing Rod')
    ; X == 7 -> buyEq('Level 4 Fishing Rod')
    ; X == 8 -> buyEq('Level 5 Fishing Rod')
    ; X == 9 -> exitStore      
    ).

buyEq(Item) :- 
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    item(Item, Id, Price),
    (Gold >= Price ->
        Gold_Now is Gold - Price,
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        assertz(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold_Now)),
        addItem(Item, 1),
        write('You bought 1 '), write(Item)
    ;
        write('You do not have enough gold')
    ).

buySeed :- 
    write('What do you want to buy?'), nl,
    write('1. Biji Kentang (50)'), nl,
    write('2. Biji Labu (65)'), nl,
    write('3. Biji Tomat (60)'), nl,
    write('4. Biji Semangka (750)'), nl,
    write('5. Biji Brokoli (30)'), nl,
    write('6. Biji Anggur (500)'), nl,
    write('7. Biji Gandum (70)'), nl,
    write('8. Biji Jagung (125)'), nl,
    write('9. Biji Nanas (1000)'), nl,
    write('10. Biji Durian (1250)'), nl,
    write('11. Exit'), nl,
    write('>'), read(X),
    (X == 1 -> buySd('Biji Kentang')
    ; X == 2 -> buySd('Biji Labu')
    ; X == 3 -> buySd('Biji Tomat')
    ; X == 4 -> buySd('Biji Semangka')
    ; X == 5 -> buySd('Biji Brokoli')
    ; X == 6 -> buySd('Biji Anggur')
    ; X == 7 -> buySd('Biji Gandum')
    ; X == 8 -> buySd('Biji Jagung')
    ; X == 9 -> buySd('Biji Nanas')
    ; X == 10 -> buySd('Biji Durian')
    ; X == 11 -> exitStore      
    ).

buySd(Item) :-
    write('How many do you want to buy?'), read(X),
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    item(Item, Id, Price),
    Price_Now is X*Price,
    (Gold >= Price ->
        Gold_Now is Gold - Price_Now,
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        assertz(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold_Now)),
        addItem(Item, X),
        write('You bought '), write(X), write(' '), write(Item)
    ;
        write('You do not have enough gold')
    ).

buyAnimal :- 
    write('What do you want to buy?'), nl,
    write('1. Cow (3000)'), nl,
    write('2. Sheep (2000)'), nl,
    write('3. Goat (1500)'), nl,
    write('4. Exit'), nl,
    write('>'), read(X),
    (X == 1 -> buyCow
    ; X == 2 -> buySheep
    ; X == 3 -> buyGoat
    ; X == 4 -> exitStore      
    ).

buyCow :- 
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    Price is 3000,
    (Gold >= Price ->
        Gold_Now is Gold - Price,
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        assertz(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold_Now)),
        cowAnimal(CowList, CowLength),
        append(CowList, [1], NewCowList),
        NewCowLength is CowLength + 1,
        retract(cowAnimal(CowList, CowLength)),
        assertz(cowAnimal(NewCowList, NewCowLength)),
        write('You bought 1 Cow')
    ;
        write('You do not have enough gold')
    ).

buySheep :- 
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    Price is 2000,
    (Gold >= Price ->
        Gold_Now is Gold - Price,
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        assertz(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold_Now)),
        sheepAnimal(SheepList, SheepLength),
        append(SheepList, [3], NewSheepList),
        NewSheepLength is SheepLength + 1,
        retract(sheepAnimal(SheepList, SheepLength)),
        assertz(sheepAnimal(NewSheepList, NewSheepLength)),
        write('You bought 1 Sheep')
    ;
        write('You do not have enough gold')
    ).

buyGoat :- 
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    Price is 1500,
    (Gold >= Price ->
        Gold_Now is Gold - Price,
        retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
        assertz(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold_Now)),
        goatAnimal(GoatList, GoatLength),
        append(GoatList, [0], NewGoatList),
        NewGoatLength is GoatLength + 1,
        retract(goatAnimal(GoatList, GoatLength)),
        assertz(goatAnimal(NewGoatList, NewGoatLength)),
        write('You bought 1 Goat')
    ;
        write('You do not have enough gold')
    ).

sell :-
    player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold),
    write('What do you want to sell?'), nl,
    inv,
    write('>'), read(X),
    write('How many?'), nl,
    write('>'), read(Y),
    drop(X,Y), !,
    item(X, Id, Price),
    Gold_Now is Gold + Y*Price,
    retract(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold)),
    assertz(player(Role, Level, FarmLevel, FishLevel, RanchLevel, EXP, EXPFarm, EXPFish, EXPRanch, Gold_Now)).
    write('Successfully sold '), write(Y), write(' '), write(X), write(' for '), write(Y*Price), write(' gold').

exitStore :-
    write('Thank you for coming').