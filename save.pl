saveDay(FILEname):-
    open(FILEname, write, FileSave),
    write('Pages are being written...'), nl,
    set_output(FileSave),
    listing,
    close(FileSave),
    write('Write successful!'), nl.
