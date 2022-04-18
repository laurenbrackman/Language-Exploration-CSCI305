dorm([room(_, 5), room(_, 4), room(_, 3), room(_, 2), room(_, 1)]).
adjacent(X,Y):- X is Y+1; X is Y-1.

hallway(X) :- dorm(X),
	     member(room(hunter,A),X),
 	     member(room(laura, B),X),
	     member(room(arnie, C),X),  
	     member(room(ramey, D),X), 	     
	     member(room(addiley, E),X),
	     A\=5,
	     B\=1,
	     C\=5,
	     C\=1,
	     D @> B,
	     \+(adjacent(C,B)),
	     \+(adjacent(C,E)).
