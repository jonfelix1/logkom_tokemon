:- dynamic(position/2).
:- dynamic(tokemon/3).

/* List Tokemon */
tokemon('Sampuramon',310,light).
tokemon('Rampmon',220,leaves).
tokemon('Kecapimon',170,water).
tokemon('Kojomon',180,fire).
tokemon('Indungmon',470,fairy).
tokemon('Saronmon',320,dark).
tokemon('Faridmon',480,fairy).

/* List Types dan hubungan kefektifan antar types */
effective(fire,leaves).
effective(water,fire).
effective(leaves,water).
effective(dark,light).
effective(light,fairy).
effective(fairy,dark).

/* Posisi awal */
position(0,0).

/* Skills */
attack(punch, 10, normal).
attack(kick, 20, normal).
attack(bite, 25, normal).
attack(slam, 40, normal).

/* Special skills */
special(black_hole, 120, dark).
special(fireball, 100, fire).
special(tsunami, 130, water).
special(sprout, 80, leaves).
special(judgement, 180, light).
special(aurora, 140, fairy).

ifThenElse(X,Y,_):- X, !, Y.
ifThenElse(_,_,Z):- Z.

ownedTokemon([]).


start :- write('======================================================================='), nl,
	write('  _______   _______   __   ___  _______   __    __   _______   _    _'), nl,
	write(' |__   __| |  ___  | |  | /  / |  _____| |  \\  /  | |  ___  | |  \\ | | '), nl,
	write('    | |    | |   | | |  |/  /  |  |____  |   \\/   | | |   | | |   \\| | '), nl,
	write('    | |    | |   | | |     /   |   ____| | |\\  /| | | |   | | | |\\   | '), nl,
	write('    | |    | |___| | |  \\  \\   |  |____  | | \\/ | | | |___| | | | \\  | '), nl,
	write('    |_|    |_______| |__|\\__\\  |_______| |_|    |_| |_______| |_|  \\_| '), nl, nl,
	write('======================================================================='), nl, nl,
	write('With:'), nl,
	write('10118031 Muhamad Hafizh Kurnia Dito     13518067 Tifany Angelia'), nl,
	write('13518025 Jon Felix Germinian            13518109 Andjani Kiranadewi'), nl, nl,
	write('Welcome to Tokemon!'), nl, nl,
	write('Available commands: '), nl,
	write('start.          -- start the game!'), nl,
	write('help.           -- show available commands'), nl,
	write('quit.           -- quit the game'), nl,
	write('w, a, s, d.     -- move'), nl,
	write('map.            -- looks at the map'), nl,
	write('heal.           -- cure the Tokemon(s) in your inventory (only at gym)'), nl,
	write('status.         -- show your stat(s)'), nl,
	write('save(Filename). -- save your game'), nl,
	write('load(Filename). -- load your game'), nl,
	menu.

menu:-
	write('> '),
	read(X),
	option(X).
	
/* Command dan rules untuk perpindahan posisi */
w :- option(w).
a :- option(a).
s :- option(s).
d :- option(d).
	
at(pagar):- write('Anda menabrak pagar.').
at(grass):- write('Anda berada pada rumput.').
at(gym):- write('Anda berada di Gym.').
	

option(attack):-
	attack(Attack,Damage,AType),
	tokemon(Nama1,Health1,Type1),
	tokemon(Nama2,Health2,Type2),
	retract(tokemon(Nama2,Health2,Type2)),
	Health3 is Health2-Damage,
	Health4 is Health2-(Damage*(1.5)),
	ifThenElse(effective(Type1,Type2),asserta(tokemon(Nama2,Health4,Type2)),asserta(tokemon(Nama2,Health3,Type2))),
	menu.
	
option(special):-
	special(Attack,Damage,AType),
	tokemon(Nama1,Health1,Type1),
	tokemon(Nama2,Health2,Type2),
	retract(tokemon(Nama2,Health2,Type2)),
	Health3 is Health2-Damage,
	Health4 is Health2-(Damage*(1.5)),
	ifThenElse(effective(Type1,Type2),asserta(tokemon(Nama2,Health4,Type2)),asserta(tokemon(Nama2,Health3,Type2))),
	menu.

option(w):-
	position(X,Y),
	retract(position(X,Y)),
	NewY is Y+1,
	asserta(position(X,NewY)),
	write('Anda bergerak ke utara.'), nl,
	menu.

option(a):-
	position(X,Y),
	retract(position(X,Y)),
	NewX is X-1,
	asserta(position(NewX,Y)),
	write('Anda bergerak ke barat.'), nl,
	menu.
	
option(s):-
	position(X,Y),
	retract(position(X,Y)),
	NewY is Y-1,
	asserta(position(X,NewY)),
	write('Anda bergerak ke selatan.'), nl,
	menu.
	
option(d):-
	position(X,Y),
	retract(position(X,Y)),
	NewX is X+1,
	asserta(position(NewX,Y)),
	write('Anda bergerak ke timur.'), nl,
	menu.
	
	
option(help) :- write('Available commands: '), nl,
	write('start.          -- start the game!'), nl,
	write('help.           -- show available commands'), nl,
	write('quit.           -- quit the game'), nl,
	write('w, a, s, d.     -- move'), nl,
	write('map.            -- looks at the map'), nl,
	write('heal.           -- cure the Tokemon(s) in your inventory (only at gym)'), nl,
	write('status.         -- show your stat(s)'), nl,
	write('save(Filename). -- save your game'), nl,
	write('load(Filename). -- load your game'), nl,
	menu.

option(map):- position(X,Y), nl,
	write('  6 XXXXXXXXXXXXXXXXXXXXXX       Map size : 20x10'), nl,
	write('  5 X--------------------X       Legend(s):'), nl,
	write('  4 X----XXX--------G----X       X = pagar'), nl,
	write('  3 X--------------------X       P = posisi awal (0,0)'), nl,
	write('  2 X------------X-------X       G = gym'), nl,
	write('  1 X------------X-------X       - = grass'), nl,
	write('  0 X---X-----P--X-------X'), nl,
	write(' -1 X---X--------X-------X       Posisi sekarang = '),
	write(X), write(','), write(Y), nl,
	write(' -2 X---X--------X-------X'), nl,
	write(' -3 X--------------------X'), nl,
	write(' -4 X--------------------X'), nl,
	write(' -5 XXXXXXXXXXXXXXXXXXXXXX'), nl,
	write('  -10   -5    0   4   8  11'), nl,
	menu.
