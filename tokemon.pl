tokemon('Balbasaur',999,water,).
tokemon('Mewtoe',999,fire)
tokemon('Squirttlee',999,water).
tokemon('Butterfly',999,leaves)
tokemon('Beddril',999,leaves)
tokemon('Pikhapikha',999,fire).
tokemon('Charmander',999,fire).
tokemon('Zigzogaan',999,leaves,).
tokemon('Icanmon',water,).
tokemon('Sangemon',leaves,).

:- dynamic position/2.
:- use_module(library(lists)).


ifThenElse(X,Y,_):- X,!,Y.
ifThenElse(_,_,Z):- Z.


start :-
    write('Welcome to Tokemon'),
    retract(position).
    assert(position(1,1)),
    menu.

%gk jalan
menu :-
	write('> '),
    read(X),
    option(X).




option(w) :-
	retract(position(X,Y)),
	newY is Y+1,
	assert(position(X,newY)),
    menu.

option(a) :-
	retract(position(X,Y)),
	newX is X-1,
	assert(position(newX,Y)),
    menu.

option(s) :-
	retract(position(X,Y)),
	newY is Y-1,
	assert(position(X,newY)),
    menu.

option(d) :-
	retract(position(X,Y)),
	newX is X+1,
	assert(position(newX,Y)),
    menu.

option('Status') :-

    menu.

option('Map') :-
	write('XXXXXXXXXXXX'), nl,
    menu.
    
option('Help') :-
	write('-------------------------------------'), nl,
	write('Movement :'), nl,
	write('w : Berjalan ke atas'), nl,
	write('s : Berjalan ke bawah'), nl,
	write('a : Berjalan ke kiri'), nl,
	write('d : Berjalan ke kanan'), nl,
	write('-------------------------------------'), nl,
	write('map : Look at the map'), nl,
	write('heal : Heal a tokemon'), nl,
	write('status : Show your status'), nl,
	menu.

print_status

fightmenu :-
    read(Choice),
    foption(Choice).
