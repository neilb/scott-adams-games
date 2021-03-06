use Test::Most;
use FindBin;
require "$FindBin::Bin/../bin/scott.pl";

my $database = 't/data/adv00';

lives_ok { ::LoadDatabase($database) } 'Loading a valid database should succeed';

my $expected_headers = {
    LightTime    => 125,
    MaxCarry     => 6,
    NumActions   => 169,
    NumItems     => 65,
    NumMessages  => 75,
    NumRooms     => 33,
    NumWords     => 69,
    PlayerRoom   => 11,
    TreasureRoom => 3,
    Treasures    => 3,
    Unknown1     => 0,
    Unknown2     => 0,
    WordLength   => 3
};
eq_or_diff \%::GameHeader, $expected_headers, '... and the headers read from the db should be correct';

my $expected_actions = [
    { Action => [ 17612, 0 ],     Condition => [ 161,  386,  160,  200,  0 ],   Vocab => 75 },
    { Action => [ 2011,  0 ],     Condition => [ 421,  667,  0,    0,    0 ],   Vocab => 10 },
    { Action => [ 1874,  8850 ],  Condition => [ 401,  420,  400,  146,  0 ],   Vocab => 10 },
    { Action => [ 2622,  0 ],     Condition => [ 523,  520,  260,  349,  0 ],   Vocab => 8 },
    { Action => [ 8312,  9064 ],  Condition => [ 108,  760,  820,  420,  100 ], Vocab => 100 },
    { Action => [ 5613,  0 ],     Condition => [ 484,  0,    0,    0,    0 ],   Vocab => 100 },
    { Action => [ 6062,  0 ],     Condition => [ 141,  140,  20,   246,  0 ],   Vocab => 5 },
    { Action => [ 11145, 0 ],     Condition => [ 406,  426,  400,  842,  146 ], Vocab => 8 },
    { Action => [ 2311,  0 ],     Condition => [ 482,  152,  0,    0,    0 ],   Vocab => 8 },
    { Action => [ 8626,  0 ],     Condition => [ 104,  308,  0,    0,    0 ],   Vocab => 100 },
    { Action => [ 7259,  7800 ],  Condition => [ 161,  246,  160,  1100, 0 ],   Vocab => 50 },
    { Action => [ 9062,  9900 ],  Condition => [ 148,  140,  940,  500,  0 ],   Vocab => 100 },
    { Action => [ 11145, 0 ],     Condition => [ 841,  426,  406,  400,  146 ], Vocab => 30 },
    { Action => [ 10504, 9150 ],  Condition => [ 542,  143,  0,    0,    0 ],   Vocab => 50 },
    { Action => [ 8005,  7950 ],  Condition => [ 248,  642,  720,  640,  700 ], Vocab => 100 },
    { Action => [ 8005,  0 ],     Condition => [ 248,  542,  1040, 540,  0 ],   Vocab => 100 },
    { Action => [ 6360,  8700 ],  Condition => [ 28,   49,   20,   40,   0 ],   Vocab => 100 },
    { Action => [ 11160, 9150 ],  Condition => [ 288,  260,  280,  0,    0 ],   Vocab => 100 },
    { Action => [ 9660,  0 ],     Condition => [ 248,  240,  0,    0,    0 ],   Vocab => 100 },
    { Action => [ 16558, 17357 ], Condition => [ 269,  260,  0,    0,    0 ],   Vocab => 100 },
    { Action => [ 4110,  9000 ],  Condition => [ 28,   48,   20,   40,   0 ],   Vocab => 100 },
    { Action => [ 9072,  11400 ], Condition => [ 320,  328,  1200, 180,  0 ],   Vocab => 100 },
    { Action => [ 10800, 0 ],     Condition => [ 524,  583,  580,  1220, 0 ],   Vocab => 100 },
    { Action => [ 1350,  0 ],     Condition => [ 1242, 0,    0,    0,    0 ],   Vocab => 4412 },
    { Action => [ 6900,  0 ],     Condition => [ 82,   0,    0,    0,    0 ],   Vocab => 4407 },
    { Action => [ 8902,  17703 ], Condition => [ 142,  421,  420,  140,  0 ],   Vocab => 1521 },
    { Action => [ 2311,  0 ],     Condition => [ 462,  146,  482,  0,    0 ],   Vocab => 1542 },
    { Action => [ 8902,  17703 ], Condition => [ 142,  401,  400,  140,  0 ],   Vocab => 1521 },
    { Action => [ 8864,  8005 ],  Condition => [ 461,  460,  502,  780,  500 ], Vocab => 2742 },
    { Action => [ 7950,  0 ],     Condition => [ 461,  460,  0,    0,    0 ],   Vocab => 2742 },
    { Action => [ 2311,  0 ],     Condition => [ 482,  146,  0,    0,    0 ],   Vocab => 1523 },
    { Action => [ 2400,  0 ],     Condition => [ 482,  141,  266,  0,    0 ],   Vocab => 1523 },
    { Action => [ 10918, 0 ],     Condition => [ 482,  141,  261,  260,  520 ], Vocab => 1523 },
    { Action => [ 9900,  0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 1533 },
    { Action => [ 7650,  0 ],     Condition => [ 364,  0,    0,    0,    0 ],   Vocab => 8454 },
    { Action => [ 9900,  0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 5100 },
    { Action => [ 8118,  8614 ],  Condition => [ 581,  344,  460,  0,    0 ],   Vocab => 7209 },
    { Action => [ 2850,  0 ],     Condition => [ 566,  0,    0,    0,    0 ],   Vocab => 2100 },
    { Action => [ 3021,  9209 ],  Condition => [ 621,  561,  620,  0,    0 ],   Vocab => 2125 },
    { Action => [ 8818,  0 ],     Condition => [ 523,  340,  0,    0,    0 ],   Vocab => 8716 },
    { Action => [ 10555, 8720 ],  Condition => [ 622,  561,  620,  240,  0 ],   Vocab => 2125 },
    { Action => [ 8170,  9600 ],  Condition => [ 404,  702,  380,  0,    0 ],   Vocab => 184 },
    { Action => [ 2400,  0 ],     Condition => [ 24,   806,  0,    0,    0 ],   Vocab => 1525 },
    { Action => [ 10918, 0 ],     Condition => [ 24,   801,  800,  620,  0 ],   Vocab => 1525 },
    { Action => [ 10918, 3450 ],  Condition => [ 621,  620,  800,  0,    0 ],   Vocab => 2725 },
    { Action => [ 3300,  0 ],     Condition => [ 362,  561,  0,    0,    0 ],   Vocab => 2125 },
    { Action => [ 17100, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 6803 },
    { Action => [ 3750,  0 ],     Condition => [ 384,  0,    0,    0,    0 ],   Vocab => 185 },
    { Action => [ 7918,  0 ],     Condition => [ 762,  760,  505,  0,    0 ],   Vocab => 1510 },
    { Action => [ 7986,  8700 ],  Condition => [ 761,  760,  582,  20,   0 ],   Vocab => 2710 },
    { Action => [ 509,   0 ],     Condition => [ 921,  920,  0,    0,    0 ],   Vocab => 6343 },
    { Action => [ 8902,  17700 ], Condition => [ 122,  261,  260,  240,  0 ],   Vocab => 1513 },
    { Action => [ 8164,  0 ],     Condition => [ 384,  420,  726,  0,    0 ],   Vocab => 900 },
    { Action => [ 8164,  0 ],     Condition => [ 424,  380,  0,    0,    0 ],   Vocab => 900 },
    { Action => [ 3900,  0 ],     Condition => [ 424,  502,  0,    0,    0 ],   Vocab => 185 },
    { Action => [ 8170,  9600 ],  Condition => [ 424,  505,  440,  0,    0 ],   Vocab => 185 },
    { Action => [ 10853, 11400 ], Condition => [ 723,  0,    680,  900,  682 ], Vocab => 8754 },
    { Action => [ 7650,  0 ],     Condition => [ 364,  0,    0,    0,    0 ],   Vocab => 204 },
    { Action => [ 4259,  8008 ],  Condition => [ 521,  502,  520,  480,  280 ], Vocab => 2723 },
    { Action => [ 2400,  0 ],     Condition => [ 122,  266,  0,    0,    0 ],   Vocab => 1513 },
    { Action => [ 300,   0 ],     Condition => [ 62,   0,    0,    0,    0 ],   Vocab => 5751 },
    { Action => [ 8170,  9600 ],  Condition => [ 40,   102,  0,    0,    0 ],   Vocab => 207 },
    { Action => [ 10918, 4350 ],  Condition => [ 241,  240,  260,  367,  0 ],   Vocab => 2713 },
    { Action => [ 8909,  6669 ],  Condition => [ 443,  1201, 440,  1200, 0 ],   Vocab => 8267 },
    { Action => [ 8303,  1050 ],  Condition => [ 100,  102,  292,  80,   221 ], Vocab => 1257 },
    { Action => [ 900,   0 ],     Condition => [ 104,  322,  286,  0,    0 ],   Vocab => 10370 },
    { Action => [ 900,   0 ],     Condition => [ 104,  322,  286,  0,    0 ],   Vocab => 5570 },
    { Action => [ 4558,  7950 ],  Condition => [ 221,  60,   220,  0,    0 ],   Vocab => 3611 },
    { Action => [ 8303,  11400 ], Condition => [ 322,  281,  320,  340,  0 ],   Vocab => 10370 },
    { Action => [ 3750,  0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 8400 },
    { Action => [ 5011,  0 ],     Condition => [ 384,  721,  0,    0,    0 ],   Vocab => 900 },
    { Action => [ 10853, 11400 ], Condition => [ 723,  0,    680,  900,  682 ], Vocab => 8604 },
    { Action => [ 7918,  4800 ],  Condition => [ 722,  720,  0,    0,    0 ],   Vocab => 1537 },
    { Action => [ 5100,  0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 4800 },
    { Action => [ 9813,  0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 3900 },
    { Action => [ 3900,  0 ],     Condition => [ 762,  502,  0,    0,    0 ],   Vocab => 1510 },
    { Action => [ 5303,  8850 ],  Condition => [ 761,  585,  820,  760,  0 ],   Vocab => 2710 },
    { Action => [ 18410, 16710 ], Condition => [ 68,   765,  60,   0,    0 ],   Vocab => 1088 },
    { Action => [ 18339, 9000 ],  Condition => [ 68,   60,   542,  0,    0 ],   Vocab => 1089 },
    { Action => [ 9750,  0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 4950 },
    { Action => [ 10610, 17055 ], Condition => [ 401,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 10610, 17055 ], Condition => [ 421,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 15300, 0 ],     Condition => [ 364,  0,    0,    0,    0 ],   Vocab => 184 },
    { Action => [ 7650,  0 ],     Condition => [ 682,  0,    0,    0,    0 ],   Vocab => 1554 },
    { Action => [ 6212,  8250 ],  Condition => [ 502,  860,  360,  500,  0 ],   Vocab => 7650 },
    { Action => [ 8003,  8293 ],  Condition => [ 521,  542,  480,  880,  540 ], Vocab => 2723 },
    { Action => [ 9001,  16607 ], Condition => [ 68,   60,   0,    0,    0 ],   Vocab => 1069 },
    { Action => [ 9600,  0 ],     Condition => [ 342,  0,    0,    0,    0 ],   Vocab => 10370 },
    { Action => [ 10554, 9600 ],  Condition => [ 702,  380,  0,    0,    0 ],   Vocab => 166 },
    { Action => [ 8308,  4710 ],  Condition => [ 68,   760,  100,  80,   762 ], Vocab => 1088 },
    { Action => [ 16614, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 6761 },
    { Action => [ 197,   0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 5400 },
    { Action => [ 8170,  9600 ],  Condition => [ 82,   60,   0,    0,    0 ],   Vocab => 207 },
    { Action => [ 8303,  1200 ],  Condition => [ 102,  221,  100,  80,   281 ], Vocab => 1257 },
    { Action => [ 3947,  0 ],     Condition => [ 502,  0,    0,    0,    0 ],   Vocab => 5888 },
    { Action => [ 5897,  0 ],     Condition => [ 542,  0,    0,    0,    0 ],   Vocab => 5889 },
    { Action => [ 509,   7800 ],  Condition => [ 241,  240,  260,  0,    0 ],   Vocab => 6313 },
    { Action => [ 450,   0 ],     Condition => [ 122,  0,    0,    0,    0 ],   Vocab => 6313 },
    { Action => [ 509,   0 ],     Condition => [ 463,  460,  0,    0,    0 ],   Vocab => 6342 },
    { Action => [ 8303,  810 ],   Condition => [ 322,  68,   320,  340,  60 ],  Vocab => 1070 },
    { Action => [ 4950,  0 ],     Condition => [ 524,  10,   0,    0,    0 ],   Vocab => 4050 },
    { Action => [ 8170,  9600 ],  Condition => [ 524,  11,   200,  0,    0 ],   Vocab => 4050 },
    { Action => [ 5700,  0 ],     Condition => [ 226,  0,    0,    0,    0 ],   Vocab => 1200 },
    { Action => [ 12768, 9358 ],  Condition => [ 943,  221,  220,  500,  140 ], Vocab => 7232 },
    { Action => [ 12768, 9366 ],  Condition => [ 221,  527,  220,  500,  0 ],   Vocab => 7232 },
    { Action => [ 7650,  0 ],     Condition => [ 183,  0,    0,    0,    0 ],   Vocab => 4217 },
    { Action => [ 7918,  0 ],     Condition => [ 142,  140,  0,    0,    0 ],   Vocab => 1521 },
    { Action => [ 7403,  8700 ],  Condition => [ 203,  169,  960,  160,  0 ],   Vocab => 4217 },
    { Action => [ 150,   0 ],     Condition => [ 203,  228,  0,    0,    0 ],   Vocab => 4217 },
    { Action => [ 7558,  9209 ],  Condition => [ 203,  208,  220,  960,  0 ],   Vocab => 4217 },
    { Action => [ 7558,  9209 ],  Condition => [ 203,  188,  200,  980,  0 ],   Vocab => 4217 },
    { Action => [ 7403,  8700 ],  Condition => [ 203,  168,  980,  180,  0 ],   Vocab => 4217 },
    { Action => [ 462,   10800 ], Condition => [ 401,  400,  420,  0,    0 ],   Vocab => 7650 },
    { Action => [ 463,   9150 ],  Condition => [ 421,  0,    0,    0,    0 ],   Vocab => 7650 },
    { Action => [ 15300, 0 ],     Condition => [ 527,  0,    0,    0,    0 ],   Vocab => 4050 },
    { Action => [ 150,   0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 9000 },
    { Action => [ 17785, 18600 ], Condition => [ 222,  0,    0,    0,    0 ],   Vocab => 7232 },
    { Action => [ 1500,  0 ],     Condition => [ 183,  0,    0,    0,    0 ],   Vocab => 2117 },
    { Action => [ 15450, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 6807 },
    { Action => [ 8022,  17700 ], Condition => [ 521,  480,  520,  260,  0 ],   Vocab => 2723 },
    { Action => [ 15450, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 6780 },
    { Action => [ 15450, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 6771 },
    { Action => [ 9062,  17700 ], Condition => [ 68,   60,   524,  220,  200 ], Vocab => 1110 },
    { Action => [ 8170,  9600 ],  Condition => [ 224,  560,  0,    0,    0 ],   Vocab => 207 },
    { Action => [ 16605, 16350 ], Condition => [ 524,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 16605, 0 ],     Condition => [ 224,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 16605, 0 ],     Condition => [ 384,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 16606, 0 ],     Condition => [ 464,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 16609, 0 ],     Condition => [ 264,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 16609, 0 ],     Condition => [ 344,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 16609, 0 ],     Condition => [ 304,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 16605, 0 ],     Condition => [ 424,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 16608, 0 ],     Condition => [ 164,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 8005,  0 ],     Condition => [ 281,  322,  340,  320,  0 ],   Vocab => 5570 },
    { Action => [ 8156,  10564 ], Condition => [ 342,  120,  0,    0,    0 ],   Vocab => 206 },
    { Action => [ 10810, 11400 ], Condition => [ 203,  200,  180,  0,    0 ],   Vocab => 2117 },
    { Action => [ 10918, 1426 ],  Condition => [ 183,  180,  200,  0,    0 ],   Vocab => 5567 },
    { Action => [ 1711,  0 ],     Condition => [ 62,   0,    0,    0,    0 ],   Vocab => 1551 },
    { Action => [ 8170,  9600 ],  Condition => [ 1042, 480,  0,    0,    0 ],   Vocab => 166 },
    { Action => [ 16611, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 1549 },
    { Action => [ 3600,  0 ],     Condition => [ 561,  365,  0,    0,    0 ],   Vocab => 2100 },
    { Action => [ 150,   0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 7650 },
    { Action => [ 8118,  8464 ],  Condition => [ 581,  347,  340,  667,  527 ], Vocab => 7209 },
    { Action => [ 16605, 0 ],     Condition => [ 24,   0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 5700,  0 ],     Condition => [ 226,  0,    0,    0,    0 ],   Vocab => 3611 },
    { Action => [ 16616, 15450 ], Condition => [ 404,  0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 17785, 150 ],   Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 7232 },
    { Action => [ 8170,  9600 ],  Condition => [ 84,   100,  0,    0,    0 ],   Vocab => 166 },
    { Action => [ 7918,  0 ],     Condition => [ 462,  460,  0,    0,    0 ],   Vocab => 1542 },
    { Action => [ 270,   0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 7050 },
    { Action => [ 197,   0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 1200 },
    { Action => [ 16800, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 3600 },
    { Action => [ 9122,  150 ],   Condition => [ 68,   60,   0,    0,    0 ],   Vocab => 1050 },
    { Action => [ 17771, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 5315 },
    { Action => [ 150,   0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 4200 },
    { Action => [ 17785, 150 ],   Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 7200 },
    { Action => [ 17850, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 6300 },
    { Action => [ 15673, 10800 ], Condition => [ 241,  364,  240,  260,  0 ],   Vocab => 2713 },
    { Action => [ 10800, 0 ],     Condition => [ 2,    1120, 0,    0,    0 ],   Vocab => 0 },
    { Action => [ 7650,  0 ],     Condition => [ 2,    0,    0,    0,    0 ],   Vocab => 1559 },
    { Action => [ 17752, 0 ],     Condition => [ 1122, 1120, 0,    0,    0 ],   Vocab => 1559 },
    { Action => [ 17100, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 6750 },
    { Action => [ 10623, 7500 ],  Condition => [ 1243, 0,    0,    0,    0 ],   Vocab => 5762 },
    { Action => [ 6900,  0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 4366 },
    { Action => [ 15300, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 900 },
    { Action => [ 17100, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 5868 },
    { Action => [ 3750,  0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 5850 },
    { Action => [ 17825, 11400 ], Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 4350 },
    { Action => [ 18150, 0 ],     Condition => [ 0,    0,    0,    0,    0 ],   Vocab => 1050 },
    { Action => [ 8176,  0 ],     Condition => [ 584,  600,  0,    0,    0 ],   Vocab => 166 }
];

eq_or_diff \@::Actions, $expected_actions, 'The actions read from the db should be correct';

is @::Actions, $::GameHeader{NumActions} + 1, '... and they should match the header';

my $expected_verbs = [
    'AUT',
    'GO', '*ENT', '*RUN', '*WAL', '*CLI',
    'JUM',
    'AT',
    'CHO', '*CUT',
    'GET', '*TAK', '*PIC', '*CAT',
    'LIG', '*.',   '*IGN', '*BUR',
    'DRO', '*REL', '*SPI', '*LEA', '*GIV', '*POU',
    'THR', '*TOS',
    'QUI',
    'SWI',
    'RUB',
    'LOO', '*EXA', '*DES',
    'STO',
    'SCO',
    'INV',
    'SAV',
    'WAK',
    'UNL',
    'REA',
    'ATT', '*SLA', '*KIL',
    'DRI', '*EAT',
    '.',
    'FIN', '*LOC',
    'HEL',
    'SAY', '*SPE', '*CAL',
    'SCR', '*YEL', '*HOL',
    '.',
    'FIL',
    'CRO',
    'DAM',
    'MAK', '*BUI',
    'WAV', '*TIC', '*KIC', '*KIS', '*TOU', '*FEE', '*FUC', '*HIT', '*POK',
    'OPE'
];

eq_or_diff \@::Verbs, $expected_verbs, 'The verbs and their synonyms should be correct';
is @::Verbs, $::GameHeader{NumWords} + 1, '... and they should match the header';

my $expected_nouns = [
    'ANY',
    'NOR',
    'SOU',
    'EAS',
    'WES',
    'UP',
    'DOW',
    'NET',
    'FIS',
    'AWA',
    'MIR',
    'AXE', '*AX',
    'WAT',
    'BOT', '*CON',
    'HOL',
    'LAM',
    'SPI',
    'WIN',
    'DOO',
    'MUD', '*MED',
    'BEE',
    'ROC',
    'GAS',
    'FLI',
    'EGG',
    'OIL', '*SLI',
    'KEY',
    'HEL',
    'BUN',
    'INV',
    'LED',
    'THR',
    'CRO',
    'BRI',
    'BEA',
    'DRA',
    'RUG',
    'RUB',
    'HON',
    'FRU',
    'OX',
    'RIN',
    'CHI', '*BIT',
    'BRA',
    'SIG',
    'BLA',
    'WEB', '*WRI',
    'SWA',
    'LAV', '*DAM',
    'HAL',
    'TRE', '*STU',
    'FIR',
    'SHO', '*BAN',
    'ADV',
    'GLA',
    'ARO',
    'GAM',
    'BOO',
    'CHA',
    'LAK',
    'YOH'
];
eq_or_diff \@::Nouns, $expected_nouns, 'The nouns and their synonyms should be correct';
is @::Nouns, $::GameHeader{NumWords} + 1, '... and they should match the header';

my $expected_rooms = [
    { Exits => [ 0,  7,  10, 1,  0,  24 ], Text => '' },
    { Exits => [ 23, 0,  29, 25, 0,  0 ],  Text => 'dismal swamp' },
    { Exits => [ 0,  0,  0,  0,  0,  1 ],  Text => 'top of a tall cypress tree' },
    { Exits => [ 0,  0,  0,  0,  1,  4 ],  Text => 'damp hollow stump in the swamp' },
    { Exits => [ 0,  0,  0,  0,  3,  0 ],  Text => 'root chamber under the stump' },
    { Exits => [ 0,  0,  0,  0,  4,  0 ],  Text => 'semi-dark hole by the root chamber' },
    { Exits => [ 0,  0,  0,  0,  5,  0 ],  Text => 'long down sloping hall' },
    { Exits => [ 31, 9,  0,  27, 6,  12 ], Text => '.' },
    { Exits => [ 0,  31, 0,  0,  0,  0 ],  Text => '.' },
    { Exits => [ 7,  0,  0,  0,  20, 0 ],  Text => '.' },
    { Exits => [ 26, 29, 0,  23, 0,  0 ],  Text => '*I\'m on the shore of a lake' },
    { Exits => [ 11, 11, 23, 11, 0,  0 ],  Text => 'forest' },
    { Exits => [ 13, 15, 15, 0,  0,  13 ], Text => '.' },
    { Exits => [ 0,  0,  0,  14, 12, 0 ],  Text => '.' },
    { Exits => [ 17, 12, 13, 16, 16, 17 ], Text => '.' },
    { Exits => [ 12, 0,  13, 12, 13, 0 ],  Text => '.' },
    { Exits => [ 0,  17, 0,  0,  14, 17 ], Text => '.' },
    { Exits => [ 17, 12, 12, 15, 14, 18 ], Text => '.' },
    { Exits => [ 0,  0,  0,  0,  17, 0 ],  Text => '.' },
    { Exits => [ 0,  0,  0,  20, 0,  0 ],  Text => '.' },
    { Exits => [ 0,  0,  0,  0,  0,  9 ],  Text => '.' },
    { Exits => [ 0,  0,  0,  0,  0,  0 ],  Text => '.' },
    { Exits => [ 0,  0,  0,  21, 0,  0 ],  Text => '.' },
    { Exits => [ 0,  1,  10, 11, 0,  0 ],  Text => 'sunny meadow' },
    {   Exits => [ 0, 0, 0, 0, 0, 0 ],
        Text  => "*I think I'm in real trouble now. There's a fellow here with
a pitchfork and pointed tail. ...Oh Hell!"
    },
    { Exits => [ 11, 0, 1, 0, 0, 0 ], Text => 'hidden grove' },
    { Exits => [ 0,  0, 0, 0, 0, 0 ], Text => 'quick-sand bog' },
    { Exits => [ 0,  0, 7, 0, 0, 0 ], Text => '.' },
    {   Exits => [ 0, 0, 0, 0, 0, 11 ],
        Text  => "top of an oak.
To the East I see a meadow, beyond that a lake."
    },
    { Exits => [ 10, 0, 0, 1, 0, 0 ], Text => "*I'm at the edge of a BOTTOMLESS hole" },
    {   Exits => [ 0, 0, 0, 0, 29, 24 ],
        Text  => "*I'm on a ledge just below the rim of the BOTTOMLESS hole. I
don't think I want to go down"
    },
    { Exits => [ 8,  7,  0,  0,  0,  0 ],  Text => '.' },
    { Exits => [ 32, 33, 32, 32, 32, 32 ], Text => "*I'm in an endless corridor" },
    {   Exits => [ 32, 24, 11, 24, 28, 24 ],
        Text  => "large misty room with strange
unreadable letters over all the exits."
    }
];
eq_or_diff \@::Rooms, $expected_rooms,
	'The rooms should be correct';
is @::Rooms, $::GameHeader{NumRooms}+1,
	'... and the number of rooms should match the header';

my $expected_items = [
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '4',  Location => '4',  Text => 'Dark hole' },
    { AutoGet => 'RUB', InitialLoc => '4',  Location => '4',  Text => '*Pot of RUBIES*' },
    { AutoGet => undef, InitialLoc => '2',  Location => '2',  Text => 'Spider web with writing on it' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '-HOLLOW- stump and remains of a felled tree' },
    { AutoGet => undef, InitialLoc => '1',  Location => '1',  Text => 'Cypress tree' },
    { AutoGet => undef, InitialLoc => '10', Location => '10', Text => 'Water' },
    { AutoGet => 'MUD', InitialLoc => '1',  Location => '1',  Text => 'Evil smelling mud' },
    { AutoGet => 'FIS', InitialLoc => '10', Location => '10', Text => 'Fish' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => 'AXE', InitialLoc => '10', Location => '10', Text => 'Rusty axe (Magic word `BUNYON` on it)' },
    { AutoGet => 'BOT', InitialLoc => '3',  Location => '3',  Text => 'Water in bottle' },
    { AutoGet => 'BOT', InitialLoc => '0',  Location => '0',  Text => 'Empty bottle' },
    { AutoGet => 'KEY', InitialLoc => '2',  Location => '2',  Text => 'Ring of skeleton keys' },
    { AutoGet => undef, InitialLoc => '3', Location => '3', Text => 'Sign `Leave *TREASURES* here, then say: SCORE`' },
    { AutoGet => undef, InitialLoc => '5', Location => '5', Text => 'Locked door' },
    { AutoGet => undef, InitialLoc => '0', Location => '0', Text => 'Open door with a hallway beyond' },
    { AutoGet => undef, InitialLoc => '1', Location => '1', Text => 'Swamp gas' },
    { AutoGet => undef, InitialLoc => '0', Location => '0', Text => '.' },
    { AutoGet => undef, InitialLoc => '0', Location => '0', Text => 'Chigger bites' },
    { AutoGet => undef, InitialLoc => '0', Location => '0', Text => 'Infected chigger bites' },
    { AutoGet => 'OIL', InitialLoc => '1', Location => '1', Text => 'Patches of `OILY` slime' },
    { AutoGet => undef, InitialLoc => '8', Location => '8', Text => '.' },
    { AutoGet => undef, InitialLoc => '0', Location => '0', Text => '.' },
    { AutoGet => undef, InitialLoc => '0', Location => '0', Text => '.' },
    { AutoGet => undef, InitialLoc => '0', Location => '0', Text => '.' },
    { AutoGet => undef, InitialLoc => '23', Location => '23', Text => 'Large sleeping dragon' },
    { AutoGet => 'FLI', InitialLoc => '30', Location => '30', Text => 'Flint & steel' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    {   AutoGet => undef, InitialLoc => '23', Location => '23',
        Text => 'Sign here says `In many cases mud is good. In others...`'
    },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => 'CHI', InitialLoc => '1',  Location => '1',  Text => 'Chiggers' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => 'FRU', InitialLoc => '25', Location => '25', Text => '*JEWELED FRUIT*' },
    { AutoGet => 'OX',  InitialLoc => '26', Location => '26', Text => '*Small statue of a BLUE OX*' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    {   AutoGet => undef, InitialLoc => '33', Location => '33',
        Text => 'Sign says `LIMBO. Find right exit and live again!`'
    },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '10', Location => '10', Text => 'Sign says `No swimming allowed here`' },
    { AutoGet => undef, InitialLoc => '17', Location => '17', Text => 'Arrow pointing down' },
    { AutoGet => 'FIS', InitialLoc => '0',  Location => '0',  Text => 'Dead fish' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '25', Location => '25', Text => "Sign says `Paul's place`" },
    { AutoGet => undef, InitialLoc => '11', Location => '11', Text => 'Trees' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '.' },
    { AutoGet => 'ADV', InitialLoc => '29', Location => '29', Text => 'Large outdoor Advertisement' },
    { AutoGet => undef, InitialLoc => '29', Location => '29', Text => 'Hole' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '' },
    { AutoGet => undef, InitialLoc => '0',  Location => '0',  Text => '' }
];
eq_or_diff \@::Items, $expected_items,
	'The items read should be correct';
is @::Items, $::GameHeader{NumItems}+1,
	'... and the number of items should be correct';

my $expected_messages = [
   '',
   'Nothing happens',
   'Chop \'er down!',
   'BOY that really hit the spot!',
   'Dragon smells something. Awakens & attacks me!',
   'Lock shatters',
   'I can\'t its locked',
   'TIMBER. Something fell from the tree top & vanished in the swamp',
   'TIMBER!',
   'Maybe I should read it?',
   '.',
   'I\'m bit by a spider',
   "My chigger bites are now INFECTED!\n",
   'My bites have rotted my whole body!',
   '.',
   '.',
   'First I need an empty container.',
   '.',
   'Something I\'m holding vibrates and...',
   'nothing to light it with',
   '.',
   'in my hands!',
   'gas needs to be contained before it will burn',
   'Gas dissipates. (I think you blew it)',
   'That won\'t ignite',
   'How?',
   '.',
   '.',
   '.',
   'It soaks into the ground',
   'In 2 words tell me at what...like: AT TREE',
   '.',
   'Its heavy!',
   'Somethings too heavy. I fall.',
   'To stop game say QUIT',
   '.',
   '.',
   'You lost *ALL* treasures.',
   'I\'m not carrying ax, take inventory!',
   'It doesn\'t seem to bother him at all!',
   'The mud dried up and fell off.',
   '.',
   '.',
   '.',
   '.',
   "I'm bitten by chiggers.\n",
   'There\'s something there all right! Maybe I should go there?',
   'Maybe if I threw something?...',
   'Too dry, the fish died.',
   '.',
   "Purchase a copy of `ADVENTURELAND` from your favorite dealer\ntoday!\n",
   'No, its too hot.',
   'Not here.',
   'Try the swamp',
   'Sizzle...',
   'Try --> `LOOK, JUMP, SWIM, CLIMB, FIND, TAKE, SCORE, DROP`
and any other verbs you can think of...',
   'There are only 3 ways to wake the Dragon!',
   'Remember you can always say `HELP`',
   'Read the sign in the meadow!',
   'You may need to say magic words here',
   'A voice BOOOOMS out:',
   'please leave it alone',
   'Sorry, I can only throw the ax.',
   'Medicine is good for bites.',
   'I don\'t know where it is',
   'Welcome to Adventure International\'s Mini-Adventure Sampler!
This is a small but complete Adventure. You must find the 3
hidden Treasures and store them away! Say: `score` to see
how well you\'re doing!
',
   'Blow it up!',
   'Fish have escaped back to the lake.',
   'OK',
   'Huh? I don\'t think so!',
   'You might try examining things...',
   'What?',
   'OK, I threw it.',
   'This Mini-Adventure is but a small sample of what awaits you in
our Classic: ADVENTURELAND, which contains an additional 10
treasures, magic carpets, killer bees, burning lava and much
much more!
',
   'The ax vibrated!',
   'I see nothing special'
];

eq_or_diff \@::Messages, $expected_messages,
    'The messages read should be correct';
is @::Messages, $::GameHeader{NumMessages}+1,
	'... and the number of messages should be correct';

done_testing;
