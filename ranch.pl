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
  Total is 0,
  (ranchItem(1, Duration),
  Duration < 1 -> (
    write('Halo1\n'),
    Total = Total+1,
    write('Halo'),
    retract(ranchItem(1, Duration)),
    assertz(ranchItem(1,1))
  )),
  write('Anda mendapatkan '),
  write(Total),
  write(' susu\n')
).

sheep :- (
  assertz(count(0)),
  (ranchItem(2, Duration),
  Duration < 1 -> (
    count(X),
    write(X),
    NewX is X+1,
    retract(count(X)),
    assertz(count(NewX)),
    retract(ranchItem(2, Duration)),
    assertz(ranchItem(2,3))
  )),
  write('Anda mendapatkan '),
  count(X),
  write(X),
  write(' wool\n'),
  retract(count(X))
).

goat :- (
  Total is 0,
  ranchItem(3, Duration),
  Total is Total+1,
  retract(ranchItem(3, Duration)),
  write('Anda mendapatkan '),
  write(Total),
  write(' daging\n')
).