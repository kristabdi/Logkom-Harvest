/* File : farm.pl */
/* Store farming information */
:- dynamic(counter/1).

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
  tilledGround(_, X, Y, _, _),
  (X==Player_X , Y==Player_Y -> (
    /* TODO Write inventory */

    write('Which plant?'), nl,
    read(TypePlant),
    
    interiorObject(Player_X, Player_Y, 'P'),
    tilledGround(Counter, Player_X, Player_Y, _, _),
    retract(tilledGround(Counter, _, _, _, _)),

    seed(TypePlant, Duration),
    assertz(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration)),
    write('Successfully planted '),
    writeTypePlant(TypePlant)
  ); write('You havent tilled the ground yet!\n'))
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
    Id is TypePlant+10,
    item(_, Id, SellPrice),
    
    /* TODO Masukkan ke inventory*/

    retract(tilledGround(Counter, Player_X, Player_Y, TypePlant, Duration)),
    assertz(tilledGround(Counter, 0, 0, 0, 0))
  );(
    write('Im not ready ~plant\n')
  )),

  finishQuest(1, TypePlant)
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