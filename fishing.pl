/* File : fish.pl */
/* Store fishing information */

fish(zonk, 1, 0).
fish(sandal, 1, 5).
fish(ember, 1, 5).
fish(lele, 2, 300).
fish(mujair, 2, 400).
fish(kakap, 3, 600).
fish(gurame, 3, 600).
fish(belut, 4, 750).
fish(kepiting, 6, 900).
fish(lobster, 8, 1250).
fish(arwana, 10, 2500).

letsFish :- (
  player(_,_,_,Lvl, _,_,_,_),
  (Lvl =:= 1 -> (
    random(1, 4, Type)
  );Lvl =:= 2 -> (
    random(1, 6, Type)
  );Lvl =:= 3 -> (
    random(1, 8, Type)
  );Lvl =:= 4 -> (
    random(1, 9, Type)
  );Lvl > 4 -> (
    Lvl < 7 -> (
      random(1, 10, Type)
    );Lvl > 7 -> (
      Lvl < 9 -> (
        random(1, 11, Type)
      ); Lvl > 9 -> (
        random(1, 12, Type)
      )
    )
  )),
  
  write(Type),
  write('\n'),

  (Type =:= 1 -> (
    write('Anda tidak mendapatkan apa-apa\n')
  );Type =:= 2 -> (
    write('Anda mendapatkan sandal!\n'),
    fish(sandal, _, SellPrice),
    assertz(inventory(sandal, SellPrice))
  );
  Type =:= 3 -> (
    write('Anda mendapatkan ember!\n'),
    fish(ember, _, SellPrice),
    assertz(inventory(ember, SellPrice))
  );
  Type =:= 4 -> (
    write('Anda mendapatkan lele!\n'),
    fish(lele, _, SellPrice),
    assertz(inventory(lele, SellPrice))
  );
  Type =:= 5 -> (
    write('Anda mendapatkan mujair!\n'),
    fish(mujair, _, SellPrice),
    assertz(inventory(mujair, SellPrice))
  );
  Type =:= 6 -> (
    write('Anda mendapatkan kakap!\n'),
    fish(kakap, _, SellPrice),
    assertz(inventory(kakap, SellPrice))
  );
  Type =:= 7 -> (
    write('Anda mendapatkan gurame!\n'),
    fish(gurame, _, SellPrice),
    assertz(inventory(gurame, SellPrice))
  );
  Type =:= 8 -> (
    write('Anda mendapatkan belut!\n'),
    fish(belut, _, SellPrice),
    assertz(inventory(belut, SellPrice))
  );
  Type =:= 9 -> (
    write('Anda mendapatkan kepiting!\n'),
    fish(kepiting, _, SellPrice),
    assertz(inventory(kepiting, SellPrice))
  );
  Type =:= 10 -> (
    write('Anda mendapatkan kepiting!\n'),
    fish(lobster, _, SellPrice),
    assertz(inventory(lobster, SellPrice))
  );
  Type =:= 11 -> (
    write('Anda mendapatkan arwana!\n'),
    fish(arwana, _, SellPrice),
    assertz(inventory(arwana, SellPrice))
  ))
).