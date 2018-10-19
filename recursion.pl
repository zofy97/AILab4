% calculate the sum of the list
listSum([], 0).
listSum([H | T], Sum) :-	listSum(T, Rest),
							Sum is H + Rest.

% find out the smallest number of the list							
minList([H | T], Min) :-	minList(T, H, Min).
minList([], Min, Min).
minList([H | T], Min0, Min) :-	Min1 is min(H, Min0),
								minList(T, Min1, Min).
	
% all numbers of the list are doubled	
doubleList([], []).
doubleList([H | T], [X | NewList]) :-	X is H * 2,
										doubleList(T, NewList).
										
% remove all odd number of the list
removeEvenNums([], []).
removeEvenNums([El|T], NewT)   :- El mod 2 =:= 0, removeEvenNums(T, NewT).
removeEvenNums([H|T1], [H|T2]) :- H  mod 2 =\= 0, removeEvenNums(T1, T2). 