/* File : ranch.pl */
/* Store ranching information */
:- dynamic(cowAnimal/2).
:- dynamic(sheepAnimal/2).
:- dynamic(goatAnimal/2).

list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).

list_length([],0).
list_length([_|TAIL],N) :- list_length(TAIL,N1), N is N1 + 1.

list_zero([],0) :- !.
list_zero([H|TAIL],N) :- (
  list_zero(TAIL,N1),
  ((H < 1) -> (N is N1 + 1); N is N1)
).

list_nonzero([],0) :- !.
list_nonzero([H|TAIL],N) :- (
  list_nonzero(TAIL,N1),
  ((H > 0) -> (N is N1 + 1); N is N1)
).

list_delete(A, [A|B], B).
list_delete(A, [B, C|D], [B|E]) :-
  list_delete(A, [C|D], E).

list_replace(A, X, [A|B], [X|B]).
list_replace(A, X, [B, C|D], [B|E]) :-
  list_replace(A, X, [C|D], E).

list_reduce([], []).
list_reduce([H|T], [X|New]) :- (
  list_reduce(T, New),
  X is H - 1
).

/* Format animal(Type, Produk, HargaProduk, Cooldown) */
/* Type 1=cow, 2=sheep, 3=goat */
/* Produk 1=milk, 2=wool, 3=meat */ 
animal(1,1, 500, 1).
animal(1,3, 7500,0).
animal(2,2, 700, 3).
animal(3,3, 5000, 0).

/*
cowAnimal(CowDurationList,2).
sheepAnimal(SheepDurationList,4).
goatAnimal(GoatDurationList,2). 
*/

ranch :- (
  interiorObject(Player_X, Player_Y, Karakter),
  (Karakter == 'R' -> (
    write('You have these animals: \n'),
    cowAnimal(_, Cow),
    sheepAnimal(_, Sheep),
    goatAnimal(_, Goat),
    write('Cow = '),
    write(Cow),
    write('\n'),
    
    write('Sheep = '),
    write(Sheep),
    write('\n'),
    
    write('Goat = '),
    write(Goat),
    write('\n'),
    
    write('What do you want to do? \n')  
  ))
).

cow :- (
  interiorObject(Player_X, Player_Y, Karakter),
  (Karakter == 'R' -> (
    cowAnimal(CowList, CowLength),
    (CowLength>0 -> (
      write('You can do these to your cow\n'),
      write('1. Take milk\n'),
      write('2. Take meat\n'),
      read(Choice),
      (Choice =:= 1 -> (
        list_zero(CowList, Zero),
        (Zero>0 -> (
          list_replace(0, 1, CowList, NewCowList),

          assertz(cowAnimal(NewCowList, CowLength)),
          retract(cowAnimal(CowList, CowLength)),

          write('Congratulations, you get '),
          write(Zero),
          write(' milk \n'),

          item(Name, 40, _),
          addItem(Name, Zero),

          addExp(3)
        ); write('Your cow hasnt produced any milk\n Check again tomorrow\n'))

      ); Choice =:=2 -> (
        retract(cowAnimal(CowList, CowLength)),
        write('Congratulations, you get '),
        write(CowLength),
        write(' beef \n'),

        item(Name, 41, _),
        addItem(Name, CowLength),

        addExp(3)
      ))
    ); write('You dont have any cow! \n'))
  ))
).

sheep :- (
  interiorObject(Player_X, Player_Y, Karakter),
  (Karakter == 'R' -> (
    sheepAnimal(SheepList, SheepLength),
    (SheepLength>0 -> (
      list_zero(SheepList, Zero),
      (Zero>0 -> (
        list_replace(0, 1, SheepList, NewSheepList),
      
        assertz(sheepAnimal(NewSheepList, SheepLength)),
        retract(sheepAnimal(SheepList, SheepLength)),
      
        write('Congratulations, you get '),
        write(Zero),
        write(' wool \n'),

        item(Name, 43, _),
        addItem(Name, Zero),
      
        addExp(3)
      ); write('Your sheep hasnt produced any wool\n Check again tomorrow\n'))
    ); write('You dont have any sheep! \n'))
  ))
).

goat :- (
  interiorObject(Player_X, Player_Y, Karakter),
  (Karakter == 'R' -> (
    goatAnimal(GoatList, GoatLength),
    (GoatLength>0 -> (
      retract(goatAnimal(GoatList, GoatLength)),
    
      write('Congratulations, you get '),
      write(GoatLength),
      write(' goat meat \n'),

      item(Name, 42, _),
      addItem(Name, GoatLength),
    
      addExp(3)
    ); write('You dont have any goat! \n'))
  ))
).

updateRanch :- (
  cowAnimal(CowList, CowLength),
  list_reduce(CowList,NewCowList),

  assertz(cowAnimal(NewCowList, CowLength)),
  retract(cowAnimal(CowList, CowLength)),

  sheepAnimal(SheepList, SheepLength),
  list_reduce(SheepList,NewSheepList),

  assertz(sheepAnimal(NewSheepList, SheepLength)),
  retract(sheepAnimal(SheepList, SheepLength)),

  goatAnimal(GoatList, GoatLength),
  list_reduce(GoatList,NewGoatList),

  assertz(goatAnimal(NewGoatList, GoatLength)),
  retract(goatAnimal(GoatList, GoatLength))
).

writeTypeRanch(TypeRanch) :-
  (
  TypeRanch =:= 1 -> (
    write('cow\n')
  )
  ;
  TypeRanch =:= 2 -> (
    write('sheep\n')
  )
  ;
  TypeRanch =:= 3 -> (
    write('goat\n')
  )
).