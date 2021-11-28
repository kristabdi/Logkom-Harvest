/* File : ranch.pl */
/* Store ranching information */
:- dynamic(cowAnimal/2).
:- dynamic(sheepAnimal/2).
:- dynamic(goatAnimal/2).

list_zero([],0) :- !.
list_zero([H|TAIL],N) :- (
  list_zero(TAIL,N1),
  ((H < 1) -> (N is N1 + 1); N is N1)
).

list_replace(A, X, [A|B], [X|B]).
list_replace(A, X, [B, C|D], [B|E]) :-
  list_replace(A, X, [C|D], E).

list_reduce([], []).
list_reduce([H|T], [X|New]) :- (
  list_reduce(T, New),
  X is H - 1
).

/*
cowAnimal(CowDurationList,2).
sheepAnimal(SheepDurationList,4).
goatAnimal(GoatDurationList,2). 
*/

cowAnimal([],0).
sheepAnimal([],0).
goatAnimal([],0). 

ranch :- (
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
).

cow :- (
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

        finishQuest(3, 40), !,

        write('Congratulations, you get '),
        write(Zero),
        write(' milk \n'),

        item(Name, 40, _),
        addItem(Name, Zero)
        
      ); write('Your cow hasnt produced any milk\n Check again tomorrow\n'))
    ); Choice =:=2 -> (
      retract(cowAnimal(CowList, CowLength)),
      assertz(cowAnimal([], 0)),

      finishQuest(3, 41), !,

      write('Congratulations, you get '),
      write(CowLength),
      write(' beef \n'),

      item(Name, 41, _),
      addItem(Name, CowLength)
    ))
  ); write('You dont have any cow! \n'))

  ;

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
        addItem(Name, Zero)
        
      ); write('Your cow hasnt produced any milk\n Check again tomorrow\n'))
    ); Choice =:=2 -> (
      retract(cowAnimal(CowList, CowLength)),
      assertz(cowAnimal([], 0)),

      write('Congratulations, you get '),
      write(CowLength),
      write(' beef \n'),

      item(Name, 41, _),
      addItem(Name, CowLength)
    ))
  ); write('You dont have any cow! \n'))
).

sheep :- (
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

      finishQuest(3, 43), !,

      item(Name, 43, _),
      addItem(Name, Zero)

      ;

      list_replace(0, 1, SheepList, NewSheepList),
    
      assertz(sheepAnimal(NewSheepList, SheepLength)),
      retract(sheepAnimal(SheepList, SheepLength)),
    
      write('Congratulations, you get '),
      write(Zero),
      write(' wool \n'),

      item(Name, 43, _),
      addItem(Name, Zero)
    
    ); write('Your sheep hasnt produced any wool\n Check again tomorrow\n'))
  ); write('You dont have any sheep! \n'))
).

goat :- (
  goatAnimal(GoatList, GoatLength),
  (GoatLength>0 -> (
    retract(goatAnimal(GoatList, GoatLength)),
    assertz(goatAnimal([], 0)),

    write('Congratulations, you get '),
    write(GoatLength),
    write(' goat meat \n'),

    finishQuest(3, 42), !,

    item(Name, 42, _),
    addItem(Name, GoatLength)
  ;
    retract(goatAnimal(GoatList, GoatLength)),
    assertz(goatAnimal([], 0)),

    write('Congratulations, you get '),
    write(GoatLength),
    write(' goat meat \n'),

    item(Name, 42, _),
    addItem(Name, GoatLength)
  
  ); write('You dont have any goat! \n'))
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
  TypeRanch =:= 40 -> (
    write('cow\n')
  )
  ;
  TypeRanch =:= 41 -> (
    write('sheep\n')
  )
  ;
  TypeRanch =:= 42 -> (
    write('goat\n')
  )
  ;
  TypeRanch =:= 43 -> (
    write('wool\n')
  )
).