/* File : farm.pl */
/* Store farming information */
:- dynamic(farm/4).

/* Format tanaman: plant(Type, GrowthDuration, BuyPrice, SellPrice) */
/* Type 1=kentang, 2=bawang bombay, 3=tomat, 4=semangka, 5=brokoli, 6=stroberi, 7=teh, 8=jagung, 9=nanas, 10=durian*/
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

/* farm(plantType, current_duration, PosisiX, PosisiY) */
farm(1, 8,1,2).
farm(2, 7,3,4).

dig:-(
  write('You digged the tile')
).

/* TODO samain kaya yang di inventory, tambahin exp, bikin fungsi dig */
letsFarm:-(
  write('Tanaman apa yang mau ditanam?  \n'),
  write('Pilih menggunakan angka        \n'),
  write('1.  Kentang                    \n'),
  write('2.  Bawang bombay              \n'),
  write('3.  Tomat                      \n'),
  write('4.  Semangka                   \n'),
  write('5.  Brokoli                    \n'),
  write('6.  Stroberi                   \n'),
  write('7.  Teh                        \n'),
  write('8.  Jagung                     \n'),
  write('9.  Nanas                      \n'),
  write('10. Durian                     \n'),
  read(Type),

  write('Mau ditanam dimana?\n'),
  write('Isi dengan koordinat X. dan Y. dipisah enter\n'),
  read(PosisiX),
  read(PosisiY),

  (farm(_,_,PosisiX, PosisiY) -> (
    write('Tile is not empty'), !
  );
    (Type =:= 1 -> (
      plant(1, Duration, _, _),
      assertz(farm(1, Duration, PosisiX, PosisiY))
    );
    Type =:= 2 -> (
      plant(2, Duration, _, _),
      assertz(farm(2, Duration, PosisiX, PosisiY))
    );
    Type =:= 3 -> (
      plant(3, Duration, _, _),
      assertz(farm(3, Duration, PosisiX, PosisiY))
    );
    Type =:= 4 -> (
      plant(4, Duration, _, _),
      assertz(farm(4, Duration, PosisiX, PosisiY))
    );
    Type =:= 5 -> (
      plant(5, Duration, _, _),
      assertz(farm(5, Duration, PosisiX, PosisiY))
    );
    Type =:= 6 -> (
      plant(6, Duration, _, _),
      assertz(farm(6, Duration, PosisiX, PosisiY))
    );
    Type =:= 7 -> (
      plant(7, Duration, _, _),
      assertz(farm(7, Duration, PosisiX, PosisiY))
    );
    Type =:= 8 -> (
      plant(8, Duration, _, _),
      assertz(farm(8, Duration, PosisiX, PosisiY))
    );
    Type =:= 9 -> (
      plant(9, Duration, _, _),
      assertz(farm(9, Duration, PosisiX, PosisiY))
    );
    Type =:= 10 -> (
      plant(10, Duration, _, _),
      assertz(farm(10, Duration, PosisiX, PosisiY))
    )),

    write('Plant successful\n')
  )
).

updateFarm :- (
  farm(Type, Duration, PosisiX, PosisiY),
  Duration_now is Duration - 1,
  retract(farm(Type, Duration, PosisiX, PosisiY)),
  assertz(farm(Type, Duration_now, PosisiX, PosisiY))
).

harvest(PosisiX, PosisiY) :- (
  farm(Type,Duration,PosisiX,PosisiY),
  Duration<1 -> (
    plant(Type, _,_, SellPrice),
    write(SellPrice),
    retract(farm(Type,Duration,PosisiX,PosisiY))
  );(
    write('Im not ready ~plant\n')
  )
).