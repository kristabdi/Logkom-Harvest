/* File : fish.pl */
/* Store fishing information */

fishItem(zonk, 1, 0).
fishItem(sandal, 1, 5).
fishItem(ember, 1, 5).
fishItem(lele, 2, 300).
fishItem(mujair, 2, 400).
fishItem(kakap, 3, 600).
fishItem(gurame, 3, 600).
fishItem(belut, 4, 750).
fishItem(kepiting, 6, 900).
fishItem(lobster, 8, 1250).
fishItem(arwana, 10, 2500).


/* TODO tambah exp */
fish :- (
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
    fishItem(sandal, _, SellPrice),
    assertz(inventory(sandal, SellPrice))
  );
  Type =:= 3 -> (
    write('Anda mendapatkan ember!\n'),
    fishItem(ember, _, SellPrice),
    assertz(inventory(ember, SellPrice))
  );
  Type =:= 4 -> (
    write('Anda mendapatkan lele!\n'),
    fishItem(lele, _, SellPrice),
    assertz(inventory(lele, SellPrice))
  );
  Type =:= 5 -> (
    write('Anda mendapatkan mujair!\n'),
    fishItem(mujair, _, SellPrice),
    assertz(inventory(mujair, SellPrice))
  );
  Type =:= 6 -> (
    write('Anda mendapatkan kakap!\n'),
    fishItem(kakap, _, SellPrice),
    assertz(inventory(kakap, SellPrice))
  );
  Type =:= 7 -> (
    write('Anda mendapatkan gurame!\n'),
    fishItem(gurame, _, SellPrice),
    assertz(inventory(gurame, SellPrice))
  );
  Type =:= 8 -> (
    write('Anda mendapatkan belut!\n'),
    fishItem(belut, _, SellPrice),
    assertz(inventory(belut, SellPrice))
  );
  Type =:= 9 -> (
    write('Anda mendapatkan kepiting!\n'),
    fishItem(kepiting, _, SellPrice),
    assertz(inventory(kepiting, SellPrice))
  );
  Type =:= 10 -> (
    write('Anda mendapatkan kepiting!\n'),
    fishItem(lobster, _, SellPrice),
    assertz(inventory(lobster, SellPrice))
  );
  Type =:= 11 -> (
    write('Anda mendapatkan arwana!\n'),
    fishItem(arwana, _, SellPrice),
    assertz(inventory(arwana, SellPrice))
  ))
).