/* File : fish.pl */
/* Store fishing information */

/* Format fishItem(id, lvlRequrement, sellPrice) */
/* id: 1=zonk, 2=sandal, 3=ember, 4=lele, 5=mujair, 6=kakap, 7=gurame, 8=belut, 9=kepiting,
10= lobster, 11=arwana */
fishItem(1, 1, 0).
fishItem(2, 1, 5).
fishItem(3, 1, 5).
fishItem(4, 2, 300).
fishItem(5, 2, 400).
fishItem(6, 3, 600).
fishItem(7, 3, 600).
fishItem(7, 4, 750).
fishItem(9, 6, 900).
fishItem(10, 8, 1250).
fishItem(11, 10, 2500).


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
    write('You ddidnt get anything! \n')
  );Type =:= 2 -> (
    write('You got sandal!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 3 -> (
    write('You got ember!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 4 -> (
    write('You got lele!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 5 -> (
    write('You got mujair!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 6 -> (
    write('You got kakap!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 7 -> (
    write('You got gurame!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 8 -> (
    write('You got belut!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 9 -> (
    write('You got kepiting!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 10 -> (
    write('You got kepiting!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 11 -> (
    write('You got arwana!\n'),
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  ))
).