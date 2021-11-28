/* File : fish.pl */
/* Store fishing information */

:- dynamic(LvlMod/1).

LvlMod(0).
fish :- (
  interiorObject(Player_X, Player_Y, Karakter),
  (Karakter == 'o' -> (
    player(_,_,_,Lvl,_, _,_,_,_,_),
    retract(LvlMod(_)),
    assertz(LvlMod(Lvl)),

    (isInInventory(4) -> (
      NewLvl is Lvl+5,
      retract(LvlMod(_)),
      assertz(LvlMod(NewLvl))
    );isInInventory(3) -> (
      NewLvl is Lvl+4,
      retract(LvlMod(_)),
      assertz(LvlMod(NewLvl))
    );isInInventory(2) -> (
      NewLvl is Lvl+3,
      retract(LvlMod(_)),
      assertz(LvlMod(NewLvl))
    );isInInventory(1) -> (
      NewLvl is Lvl+1,
      retract(LvlMod(_)),
      assertz(LvlMod(NewLvl))
    )),
    
    LvlMod(CurLvl),
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
      item(Name, Id, SellPrice),
      addItem(Name, 1)
    ),

    finishQuest(2, Id)
  ); write('Youre not at a river!\n'))
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