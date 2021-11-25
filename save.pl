save:-
    write('Please input your save file name! (end name with a dot (.))'), nl,
    read(UserSaveName),
    atom_concat(UserSaveName, '.txt', ConvertedSaveName),
    write('File will be saved to '),
    write(ConvertedSaveName), nl,
    open(ConvertedSaveName, write, FileSave),
    write('Starting save progress...'), nl,
    set_output(FileSave),
    listing,
    close(FileSave),
    write('Game progress successfully saved!'), nl.