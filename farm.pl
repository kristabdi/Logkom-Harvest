/* File : farm.pl */
/* Store farming information */

/* Format tanaman: plant(Type, GrowthDuration, BuyPrice, SellPrice) */
/* Type 1=kentang, 2=labu, 3=tomat, 4=semangka, 5=brokoli, 6=anggur, 7=gandum, 8=jagung, 9=nanas, 10=durian*/
plant(1, 8, 50, 220).
plant(2, 8, 65, 200).
plant(3, 14, 60, 160).
plant(4, 20, 750, 3500).
plant(5, 12, 30, 110).
plant(6, 10, 500, 1500).
plant(7, 3, 70, 250).
plant(8, 16, 125, 900).
plant(9, 18, 1000, 4000).
plant(10, 15, 1250, 5000).

dig:-
  interiorObject(Player_X, Player_Y, 'P'),
  counter(CurrentCounter),
  tilledGround(CurrentCounter, Current_X, Current_Y, _, _),

  % Fill tilledGround facts
  (
  Current_X =:= 0, Current_Y =:= 0, CurrentCounter =< 15 -> (
      % Check location to see if there is already digged ground there
      (
      tilledGround(_, Player_X, Player_Y, _, _) -> (
          write('You already dugged a land here! Move somewhere else!'), !   
      );
      (
          retract(tilledGround(_, _, _, _,_)),
          assertz(tilledGround(CurrentCounter, Player_X, Player_Y, 0, 0))
      )
      )
      );    
  Current_X > 0, Current_Y > 0 -> (
      NextCounter is CurrentCounter + 1,
      retract(counter(_)),
      assertz(counter(NextCounter)),
      dig
      )    
  ).

plant:-(
  write('Which plant?'), nl,
  read(TypePlant),
  interiorObject(Player_X, Player_Y, 'P'),
  tilledGround(Counter, Player_X, Player_Y, _, _),
  retract(tilledGround(Counter, _, _, _, _)),

  plant(TypePlant, Duration, _, _),
  assertz(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration)),
  write('Successfully planted '),
  writeTypePlant(TypePlant)
).

updateFarm :- (
  tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration),
  Duration_now is Duration - 1,
  retract(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration)),
  assertz(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration_now))
).

harvest(PosisiX, PosisiY) :- (
  tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration),
  (Duration<1 -> (
    plant(Type, _,_, SellPrice),
    write(SellPrice),
    retract(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration)),
    assertz(tilledGround(Counter, 0, 0, 0, 0))
  );(
    write('Im not ready ~plant\n')
  )),

  finishQuest(1)
).

writeTypePlant(TypePlant) :-
  (
  TypePlant =:= 1 -> (
    write('kentang\n')
  )
  ;
  TypePlant =:= 2 -> (
    write('labu\n')
  )
  ;
  TypePlant =:= 3 -> (
    write('tomat\n')
  )
  ;
  TypePlant =:= 4 -> (
    write('semangka\n')
  )
  ;
  TypePlant =:= 5 -> (
    write('brokoli\n')
  )
  ;
  TypePlant =:= 6 -> (
    write('anggur\n')
  )
  ;
  TypePlant =:= 7 -> (
    write('gandum\n')
  )
  ;
  TypePlant =:= 8 -> (
    write('jagung\n')
  )
  ;
  TypePlant =:= 9 -> (
    write('nanas\n')
  )
  ;
  TypePlant =:= 10 -> (
    write('durian\n')
  )
).