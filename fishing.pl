/* File : fish.pl */
/* Store fishing information */

fish :- (
  interiorObject(Player_X, Player_Y, Karakter),
  (Karakter == 'o' -> (
    player(_,_,_,Lvl,_, _,_,_,_,_),
    (Lvl =:= 1 -> (
      random(1, 4, Type)
    );Lvl =:= 2 -> (
      random(1, 6, Type)
    );Lvl =:= 3 -> (
      random(1, 8, Type)
    );Lvl =:= 4 ->(
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