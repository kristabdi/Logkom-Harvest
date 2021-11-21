/* File : ranch.pl */
/* Store ranching information */
:- dynamic(ranchItem/2).
:- dynamic(count/1).


/* Format animal(Type, Produk, HargaProduk, Cooldown) */
/* Type 1=cow, 2=sheep, 3=goat */
/* Produk 1=milk, 2=wool, 3=meat */ 
animal(1,1, 500, 1).
animal(2,2, 700, 3).
animal(3,3, 5000, 0).

/* ranch(Type, RemainingDuration) */

ranchItem(1, 1).
ranchItem(1, 0).
ranchItem(2, 2).

/* TODO Gimana caranya print type pakai nomor? */
ranch :- (
  write('Berikut hewan yang kamu punya: \n'),
  (ranchItem(Type, Duration),
  (Type =:= 1 -> (
    write('cow\n')
  );Type =:= 2 -> (
    write('sheep\n')
  ); Type =:= 3 -> (
    write('goat\n')
  )), fail),

  write('Apa yang ingin dilakukan \n')
).

cow :- (
  assertz(count(0)),
  (ranchItem(1, Duration),
  count(X),
  Duration < 1 -> (
    NewX is X+1,
    retract(count(X)),
    assertz(count(NewX)),
    retract(ranchItem(1, Duration)),
    assertz(ranchItem(1,1))
  )),
  count(Y),
  write(Y),
  (Y > 0 -> (
    write('You get '),
    write(Y),
    write(' milk\n')
  );
    write('No milk collected\n')
  ),
  
  retract(count(Y))
).

sheep :- (
  assertz(count(0)),
  (ranchItem(2, Duration),
  count(X),
  Duration < 1 -> (
    NewX is X+1,
    retract(count(X)),
    assertz(count(NewX)),
    retract(ranchItem(2, Duration)),
    assertz(ranchItem(2,3))
  )),
  count(Y),
  write(Y),
  (Y > 0 -> (
    write('You get '),
    write(Y),
    write(' wool\n')
  );
    write('No wool collected\n')
  ),
  retract(count(Y))
).

goat :- (
  (\+ranchItem(3,_) -> (
    write('You dont have any goat\n')
  );
    write('You have got a goat meat'),
    retract(ranchItem(3,_))
  )
).