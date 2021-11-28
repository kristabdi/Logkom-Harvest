/* File : fish.pl */
/* Store fishing information */

:- dynamic(lvlMod/1).

lvlMod(0).
fish :- (
    player(_,_,_,Lvl,_, _,_,_,_,_),
    retract(lvlMod(_)),
    assertz(lvlMod(Lvl)),

    (isInInventory(9) -> (
      NewLvl is Lvl+5,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    );isInInventory(8) -> (
      NewLvl is Lvl+4,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    );isInInventory(7) -> (
      NewLvl is Lvl+3,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    );isInInventory(6) -> (
      NewLvl is Lvl+2,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    );isInInventory(5) -> (
      NewLvl is Lvl+1,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    )),
    
    lvlMod(CurLvl),
    (CurLvl =:= 1 -> (
      random(1, 4, Type)
    );CurLvl =:= 2 -> (
      random(1, 6, Type)
    );CurLvl =:= 3 -> (
      random(1, 8, Type)
    );CurLvl =:= 4 ->(
      random(1, 9, Type)
    );CurLvl > 4 -> (
      CurLvl < 7 -> (
        random(1, 10, Type)
      );CurLvl > 7 -> (
        CurLvl < 9 -> (
          random(1, 11, Type)
        ); CurLvl > 9 -> (
          random(1, 12, Type)
        )
      )
    )),
    Id is Type+8,
    finishQuest(2, Id), !,
    write('You got '),
    
    (Type =:= 1 -> (
      write('nothing\n')
    );
      writeTypeFish(Id),
      item(Name, Id, _),
      addItem(Name, 1)
    )
  ;
    player(_,_,_,Lvl,_, _,_,_,_,_),
    retract(lvlMod(_)),
    assertz(lvlMod(Lvl)),

    (isInInventory(9) -> (
      NewLvl is Lvl+5,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    );isInInventory(8) -> (
      NewLvl is Lvl+4,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    );isInInventory(7) -> (
      NewLvl is Lvl+3,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    );isInInventory(6) -> (
      NewLvl is Lvl+2,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    );isInInventory(5) -> (
      NewLvl is Lvl+1,
      retract(lvlMod(_)),
      assertz(lvlMod(NewLvl))
    )),
    
    lvlMod(CurLvl),
    (CurLvl =:= 1 -> (
      random(1, 4, Type)
    );CurLvl =:= 2 -> (
      random(1, 6, Type)
    );CurLvl =:= 3 -> (
      random(1, 8, Type)
    );CurLvl =:= 4 ->(
      random(1, 9, Type)
    );CurLvl > 4 -> (
      CurLvl < 7 -> (
        random(1, 10, Type)
      );CurLvl > 7 -> (
        CurLvl < 9 -> (
          random(1, 11, Type)
        ); CurLvl > 9 -> (
          random(1, 12, Type)
        )
      )
    )),
    
    write('You got '),
    Id is Type+8,
    (Type =:= 1 -> (
      write('nothing\n')
    );
      writeTypeFish(Id),
      item(Name, Id, _),
      addItem(Name, 1)
    )
).

writeTypeFish(TypeFish) :- (
  TypeFish =:= 10 -> (
    write('sandal\n')
  )
  ;
  TypeFish =:= 11 -> (
    write('ember\n')
  )
  ;
  TypeFish =:= 12 -> (
    write('lele\n')
  )
  ;
  TypeFish =:= 13 -> (
    write('mujair\n')
  )
  ;
  TypeFish =:= 14 -> (
    write('kakap\n')
  )
  ;
  TypeFish =:= 15 -> (
    write('gurame\n')
  )
  ;
  TypeFish =:= 16 -> (
    write('belut\n')
  )
  ;
  TypeFish =:= 17 -> (
    write('kepiting\n')
  )
  ;
  TypeFish =:= 18 -> (
    write('lobster\n')
  )
  ;
  TypeFish =:= 19 -> (
    write('arwana\n')
  )
).