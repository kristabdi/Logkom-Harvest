/* File : farm.pl */
/* Store farming information */
:- dynamic(counter/1).
:- dynamic(durationMod/1).

/* Format tanaman: seed(Type, GrowthDuration) */
/* Type 1=kentang, 2=labu, 3=tomat, 4=semangka, 5=brokoli, 6=anggur, 7=gandum, 8=jagung, 9=nanas, 10=durian*/
seed(20, 8).
seed(21, 8).
seed(22, 14).
seed(23, 20).
seed(24, 12).
seed(24, 10).
seed(25, 3).
seed(26, 16).
seed(28, 18).
seed(29, 15).

/* Dig ground */
counter(1).

dig:-
  interiorObject(Player_X, Player_Y, 'P'),
  counter(CurrentCounter),
  tilledGround(CurrentCounter, Current_X, Current_Y, _, _, _),

  % Fill tilledGround facts
  (
  Current_X =:= 0, Current_Y =:= 0, CurrentCounter =< 15 -> (
      % Check location to see if there is already digged ground there
      (
      tilledGround(_, Player_X, Player_Y, _, _, 1) -> (
          write('You already dugged a land here! Move somewhere else!'), !   
      );
      (
          retract(tilledGround(_, _, _, _,_, _)),
          assertz(tilledGround(CurrentCounter, Player_X, Player_Y, 0, 0, 1))
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

inventory(Inv).
durationMod(0).
plant:-(
  interiorObject(Player_X, Player_Y, 'P'),
  tilledGround(_, X, Y, _, _, 1),
  (X=:=Player_X , Y=:=Player_Y -> (
    printInventorySeed(Inv),  
    write('Which Id?'), nl,
    read(TypePlant),

    tilledGround(Counter, Player_X, Player_Y, _, _, _),
    retract(tilledGround(Counter, _, _, _, _, _)),

    seed(TypePlant, Duration),
    retract(durationMod(_)),
    assertz(durationMod(Duration)),

    (isInInventory(4) -> (
      NewDuration is Duration//5,
      retract(durationMod(_)),
      assertz(durationMod(NewDuration))
    );isInInventory(3) -> (
      NewDuration is Duration//4,
      retract(durationMod(_)),
      assertz(durationMod(NewDuration))
    );isInInventory(2) -> (
      NewDuration is Duration//3,
      retract(durationMod(_)),
      assertz(durationMod(NewDuration))
    );isInInventory(1) -> (
      NewDuration is Duration//1,
      retract(durationMod(_)),
      assertz(durationMod(NewDuration))
    )),
    
    durationMod(CurDur),
    assertz(tilledGround(Counter, Player_X, Player_Y, TypePlant, CurDur, 1)),
    write('Successfully planted '),
    writeTypePlant(TypePlant)
  ); write('You havent tilled the ground yet!\n'))
).

updateFarm :- (
  tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration, 1),
  Duration_now is Duration - 1,

  retract(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration, _)),
  assertz(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration_now, 1))
).

harvest :- (
  tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration, 1),
  (Duration<1 -> (
    item(Name, TypePlant, _),
    addItem(Name, 1),

    write('You got a '),
    writeTypePlant(TypePlant),

    retract(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration, _)),
    assertz(tilledGround(Counter, 0, 0, 0, 0, 0))
  );(
    write('Im not ready ~plant\n')
  )),

  finishQuest(1, TypePlant)
).

writeTypePlant(TypePlant) :-
  (
  TypePlant =:= 30 -> (
    write('kentang\n')
  )
  ;
  TypePlant =:= 31 -> (
    write('labu\n')
  )
  ;
  TypePlant =:= 32 -> (
    write('tomat\n')
  )
  ;
  TypePlant =:= 33 -> (
    write('semangka\n')
  )
  ;
  TypePlant =:= 34 -> (
    write('brokoli\n')
  )
  ;
  TypePlant =:= 35 -> (
    write('anggur\n')
  )
  ;
  TypePlant =:= 36 -> (
    write('gandum\n')
  )
  ;
  TypePlant =:= 37 -> (
    write('jagung\n')
  )
  ;
  TypePlant =:= 38 -> (
    write('nanas\n')
  )
  ;
  TypePlant =:= 39 -> (
    write('durian\n')
  )
).