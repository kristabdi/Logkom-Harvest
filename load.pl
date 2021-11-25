load:-
    write('Please input your save file name! (end name with a dot (.))'), nl,
    read(UserSaveName),
    atom_concat(UserSaveName, '.txt', ConvertedSaveName),
    write('Reading game file from '),
    write(ConvertedSaveName), 
    write('...'), nl,
    [ConvertedSaveName],
    write('Game data successfully loaded!'), nl.