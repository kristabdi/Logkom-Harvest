/* File : farm.pl */
/* Store farming information */

%:- include('map.pl').
%:- include('time.pl').

/* Format tanaman: plant(Type, GrowthDuration, BuyPrice, SellPrice) */
plant(kentang, 8, 50, 220).
plant(bawang_bombay, 8, 65, 200).
plant(tomat, 14, 60, 160).
plant(semangka, 20, 750, 3500).
plant(brokoli, 12, 30, 110).
plant(stroberi, 10, 500, 1500).
plant(teh, 3, 70, 250).
plant(jagung, 16, 125, 900).
plant(nanas, 18, 1000, 4000).
plant(durian, 15, 1250, 5000).

/* farm(plantType, current_duration, PosisiX, PosisiY) */

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

  write('Mau ditanam, dimana?\n'),
  write('Isi dengan koordinat X Y dipisah spasi\n'),
  write('Misal 3 5\n'),
  read(PosisiX),
  read(PosisiY),

  /* \+farm(_,_, x, y) -> (
    write('Petak masih ada\n')
  ), */

  (Type =:= 1 -> (
    plant(kentang, Duration, _, _),
    assertz(farm(kentang, Duration, PosisiX, PosisiY))
  );
  Type =:= 2 -> (
    plant(bawang_bombay, Duration, _, _),
    assertz(farm(bawang_bombay, Duration, PosisiX, PosisiY))
  );
  Type =:= 3 -> (
    plant(tomat, Duration, _, _),
    assertz(farm(tomat, Duration, PosisiX, PosisiY))
  );
  Type =:= 4 -> (
    plant(semangka, Duration, _, _),
    assertz(farm(semangka, Duration, PosisiX, PosisiY))
  );
  Type =:= 5 -> (
    plant(brokoli, Duration, _, _),
    assertz(farm(brokoli, Duration, PosisiX, PosisiY))
  );
  Type =:= 6 -> (
    plant(stroberi, Duration, _, _),
    assertz(farm(stroberi, Duration, PosisiX, PosisiY))
  );
  Type =:= 7 -> (
    plant(teh, Duration, _, _),
    assertz(farm(teh, Duration, PosisiX, PosisiY))
  );
  Type =:= 8 -> (
    plant(jagung, Duration, _, _),
    assertz(farm(jagung, Duration, PosisiX, PosisiY))
  );
  Type =:= 9 -> (
    plant(nanas, Duration, _, _),
    assertz(farm(nanas, Duration, PosisiX, PosisiY))
  );
  Type =:= 10 -> (
    plant(durian, Duration, _, _),
    assertz(farm(durian, Duration, PosisiX, PosisiY))
  )),

  write('Menanam berhasil\n')
  
).

updateFarm :- (
  farm(_, Duration, _, _),
  Duration_now is Duration - 1,
  retract(farm(kentang, Duration, PosisiX, PosisiY)),
  assertz(farm(kentang, Duration_now, PosisiX, PosisiY))
).

harvest(PosisiX, PosisiY) :- (
  farm(Type,Duration,PosisiX,PosisiY),
  Duration<1 -> (
    plant(Type, _,_, SellPrice),
    write(SellPrice),
    retract(farm(Type,Duration,PosisiX,PosisiY))
  );(
    write('Belum siap dijual')
  )
).