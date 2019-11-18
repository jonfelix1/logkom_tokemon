:- dynamic(position/2,tokemon/3,ownedTokemon/1,mode/1).

printTokemon(Name, Hp, Type) :-
	write(Name), nl,
	write('Health : '), write(Hp), nl,
	write('Type   : '), write(Type), nl, nl.

/* Posisi pagar */
pagar(3,-2).
pagar(3,-1).
pagar(3,0).
pagar(3,1).
pagar(3,2).
pagar(-6,0).
pagar(-6,-1).
pagar(-6,-2).
pagar(-3,4).
pagar(-4,4).
pagar(-5,4).
pagar(-10,6).
pagar(-9,6).
pagar(-8,6).
pagar(-7,6).
pagar(-6,6).
pagar(-5,6).
pagar(-4,6).
pagar(-3,6).
pagar(-2,6).
pagar(-1,6).
pagar(0,6).
pagar(1,6).
pagar(2,6).
pagar(3,6).
pagar(4,6).
pagar(5,6).
pagar(6,6).
pagar(7,6).
pagar(8,6).
pagar(9,6).
pagar(10,6).
pagar(11,6).
pagar(-10,-5).
pagar(-9,-5).
pagar(-8,-5).
pagar(-7,-5).
pagar(-6,-5).
pagar(-5,-5).
pagar(-4,-5).
pagar(-3,-5).
pagar(-2,-5).
pagar(-1,-5).
pagar(0,-5).
pagar(1,-5).
pagar(2,-5).
pagar(3,-5).
pagar(4,-5).
pagar(5,-5).
pagar(6,-5).
pagar(7,-5).
pagar(8,-5).
pagar(9,-5).
pagar(10,-5).
pagar(11,-5).
pagar(11,-4).
pagar(11,-3).
pagar(11,-2).
pagar(11,-1).
pagar(11,0).
pagar(11,1).
pagar(11,2).
pagar(11,3).
pagar(11,4).
pagar(11,5).
pagar(-10,-4).
pagar(-10,-3).
pagar(-10,-2).
pagar(-10,-1).
pagar(-10,0).
pagar(-10,1).
pagar(-10,2).
pagar(-10,3).
pagar(-10,4).
pagar(-10,5).

% Posisi Gym
gym(6,4).

/* List Tokemon */


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

dropTokemon(X):-
	ownedTokemon(L),
	member(X,L),!,
	delete(L,X,NewL),
	retract(ownedTokemon(L)),
	asserta(ownedTokemon(NewL)), write('You dropped '), write(X), nl.

dropTokemon(X):-
    	write('You dont have Tokemon!'),nl.

capture(X):-
    	mode(battle),
	tokemon(X,_,_),
	ownedTokemon(L), length(L,N), N < 6, !,
	append([X],L,NewL),
	retract(ownedTokemon(L)),
	asserta(ownedTokemon(NewL)), write('You captured '), write(X), nl.

capture(X) :-
    mode(battle),
    write('Cannot capture '), write(X), write('! You have to drop one first.'), nl.

pick(X):-
    mode(battle),
    ownedTokemon(L),


printList([]).
printList([H|T]) :-
    tokemon(H,X,Y),printTokemon(H, X, Y),
    printList(T).

start :- 
	write('======================================================================='), nl,
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
	retractall(ownedTokemon(_)),
	asserta(ownedTokemon([startermon])), retractall(tokemon(_,_,_)), 
	asserta(tokemon(startermon, 250, leaves)),
	asserta(tokemon(sampuramon,310,light)),
	asserta(tokemon(rampmon,220,leaves)),
	asserta(tokemon(kecapimon,170,water)),
	asserta(tokemon(kojomon,180,fire)),
	asserta(tokemon(indungmon,470,fairy)),
	asserta(tokemon(saronmon,320,dark)),
	asserta(tokemon(faridmon,480,fairy)),
    	retractall(enemyTokemon(_)), asserta(enemyTokemon([sampuramon,rampmon,kecapimon,kojomon,indungmon,saronmon,faridmon])),
    	retractall(mode(_)),
	asserta(mode(menu)),
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

battle :-
    mode(battle),

    /*Selesai battle*/
    mode(menu).

option(attack):-
    	mode(battle),
	attack(Attack,Damage,AType),
	tokemon(Nama1,Health1,Type1),
	tokemon(Nama2,Health2,Type2),
	retract(tokemon(Nama2,Health2,Type2)),
	Health3 is Health2-Damage,
	Health4 is Health2-(Damage*(1.5)),
	ifThenElse(effective(Type1,Type2),asserta(tokemon(Nama2,Health4,Type2)),asserta(tokemon(Nama2,Health3,Type2))),
	menu.
	
option(special):-
    	mode(battle),
	special(Attack,Damage,AType),
	tokemon(Nama1,Health1,Type1),
	tokemon(Nama2,Health2,Type2),
	retract(tokemon(Nama2,Health2,Type2)),
	Health3 is Health2-Damage,
	Health4 is Health2-(Damage*(1.5)),
	ifThenElse(effective(Type1,Type2),asserta(tokemon(Nama2,Health4,Type2)),asserta(tokemon(Nama2,Health3,Type2))),
	menu.


option(w):-
    	mode(menu),
	position(X,Y),
	retract(position(X,Y)),
	NewY is Y+1,
	ifThenElse(cekpagar(X, NewY), (nabrak, asserta(position(X,Y))), (asserta(position(X, NewY)), write('Anda bergerak ke utara'), nl)),
	ifThenElse(cekgym(X,NewY),(write('Anda berada di gym'), nl), (write('Anda berada di rumput'), nl)),
	% asserta(position(X,NewY)),
	% write('Anda bergerak ke utara.'), nl,
	menu.

option(a):-
    	mode(menu),
	position(X,Y),
	retract(position(X,Y)),
	NewX is X-1,
	ifThenElse(cekpagar(NewX, Y), (nabrak, asserta(position(X,Y))), (asserta(position(NewX, Y)), write('Anda bergerak ke barat'), nl)),
	ifThenElse(cekgym(NewX,Y),(write('Anda berada di gym'), nl), (write('Anda berada di rumput'), nl)),
	% asserta(position(NewX,Y)),
	% write('Anda bergerak ke barat.'), nl,
	menu.
	
option(s):-
    	mode(menu),
	position(X,Y),
	retract(position(X,Y)),
	NewY is Y-1,
	ifThenElse(cekpagar(X, NewY), (nabrak, asserta(position(X,Y))), (asserta(position(X, NewY)), write('Anda bergerak ke selatan'), nl)),
	ifThenElse(cekgym(X,NewY),(write('Anda berada di gym'), nl), (write('Anda berada di rumput'), nl)),
	% asserta(position(X,NewY)),
	% write('Anda bergerak ke selatan.'), nl,
	menu.
	
option(d):-
    	mode(menu),
	position(X,Y),
	retract(position(X,Y)),
	NewX is X+1,
	ifThenElse(cekpagar(NewX, Y), (nabrak, asserta(position(X,Y))), (asserta(position(NewX, Y)), write('Anda bergerak ke timur'), nl)),
	ifThenElse(cekgym(NewX,Y),(write('Anda berada di gym'), nl), (write('Anda berada di rumput'), nl)),
	% asserta(position(NewX,Y)),
	% write('Anda bergerak ke timur.'), nl,
	menu.
	
	
option(help) :- 
    	mode(menu),
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

option(map):-
    	mode(menu),
	position(X,Y), nl,
	write('  6 XXXXXXXXXXXXXXXXXXXXXX       Map size : 20x10'), nl,
	write('  5 X--------------------X       Legend(s):'), nl,
	write('  4 X----XXX--------G----X       X = pagar'), nl,
	write('  3 X--------------------X       P = posisi awal (0,0)'), nl,
	write('  2 X------------X-------X       G = gym'), nl,
	write('  1 X------------X-------X       - = grass'), nl,
	write('  0 X---X-----P--X-------X'), nl,
	write(' -1 X---X--------X-------X       Posisi sekarang = '), write(X), write(','), write(Y), nl,
	write(' -2 X---X--------X-------X'), nl,
	write(' -3 X--------------------X'), nl,
	write(' -4 X--------------------X'), nl,
	write(' -5 XXXXXXXXXXXXXXXXXXXXXX'), nl,
	write('  -10   -5    0   4   8  11'), nl,
	menu.

option(quit):-
    	mode(menu),
	write('Quiting the game...'),nl,
	halt.

option(exit) :-
	write('Quiting the game...'),nl,
	halt.

option(status):-
	write('Your Tokemon:'),nl,
	ownedTokemon(X),
	printList(X),
	write('Your Enemy:'),nl,
    	% enemyTokemon(Y),
	printList(Y), 
	menu.
	
option(save):-
    	mode(menu),
	open('loadTokemon.txt',write,OS),
	position(X,Y),
	retract(position(X,Y)),
	write(OS,X), write(OS,' '),write(OS,Y), nl(OS),
	
	ownedTokemon(Z),
	write(OS,Z), nl(OS),

    	tokemon(startermon,H,leaves),
	write(OS,startermon), write(OS,' '),write(OS,H), write(OS,' '), write(OS,leaves), nl(OS),
	tokemon(sampuramon,A,light),
	write(OS,sampuramon), write(OS,' '),write(OS,A), write(OS,' '), write(OS,light), nl(OS),
	tokemon(rampmon,B,leaves),
	write(OS,rampmon), write(OS,' '),write(OS,B), write(OS,' '), write(OS,leaves), nl(OS),
	tokemon(kecapimon,C,water),
	write(OS,kecapimon), write(OS,' '),write(OS,C), write(OS,' '), write(OS,water), nl(OS),
	tokemon(kojomon,D,fire),
	write(OS,kojomon), write(OS,' '),write(OS,D), write(OS,' '), write(OS,fire), nl(OS),
	tokemon(indungmon,E,fairy),
	write(OS,indungmon), write(OS,' '),write(OS,E), write(OS,' '), write(OS,fairy), nl(OS),
	tokemon(saronmon,F,dark),
	write(OS,saronmon), write(OS,' '),write(OS,F), write(OS,' '), write(OS,dark), nl(OS),
	tokemon(faridmon,G,fairy),
	write(OS,faridmon), write(OS,' '),write(OS,G), write(OS,' '), write(OS,fairy), nl(OS),
	
	close(OS).

cekpagar(X, Y) :-
	pagar(A,B),
	X =:= A,
	Y =:= B.

cekgym(X,Y) :-
	gym(A,B),
	X =:= A,
	Y =:= B.

nabrak  :-
	write('Anda menabrak pagar'), nl.
