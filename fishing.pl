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
    writeTypeFish(Type),
    (Type =\= 1 -> (
      Id is Type+8,
      item(Name, Id, SellPrice),
      addItem(Name, 1)
    )),

    addExp(2)
  ); write('Youre not at a river!\n'))
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