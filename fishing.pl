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

fish :- (
  write('Halo'),
  player(_,_,_,Lvl,_, _,_,_,_,_),
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
  write('You got '),
  writeTypeFish(Type),

  (Type =:= 2 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 3 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 4 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 5 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 6 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 7 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 8 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 9 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 10 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  );
  Type =:= 11 -> (
    fishItem(Type, _, SellPrice),
    assertz(inventory(Type, SellPrice))
  )),

  addExp(2)
).

writeTypeFish(TypeFish) :-
  (
  TypeFish =:= 1 -> (
    write('nothing\n')
  )
  ;
  TypeFish =:= 2 -> (
    write('sandal\n')
  )
  ;
  TypeFish =:= 3 -> (
    write('ember\n')
  )
  ;
  TypeFish =:= 4 -> (
    write('lele\n')
  )
  ;
  TypeFish =:= 5 -> (
    write('mujair\n')
  )
  ;
  TypeFish =:= 6 -> (
    write('kakap\n')
  )
  ;
  TypeFish =:= 7 -> (
    write('gurame\n')
  )
  ;
  TypeFish =:= 8 -> (
    write('belut\n')
  )
  ;
  TypeFish =:= 9 -> (
    write('kepiting\n')
  )
  ;
  TypeFish =:= 10 -> (
    write('lobster\n')
  )
  ;
  TypeFish =:= 11 -> (
    write('arwana\n')
  )
).