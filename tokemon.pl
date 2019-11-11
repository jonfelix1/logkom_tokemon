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

w :- option(w).
a :- option(a).
s :- option(s).
d :- option(d).
help :- option('Help').



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

    menu.
    
option('Help') :-
	write('-------------------------------------'), nl,
	write('Movement :'), nl,
	write('w : Berjalan ke atas'), nl,
	write('s : Berjalan ke bawah'), nl,
	write('a : Berjalan ke kiri'), nl,
	write('d : Berjalan ke kanan'), nl,
	
	menu.

fightmenu :-
    read(Choice),
    foption(Choice).
