% rule 1
investment(savings) :-	savings_account(inadequate).

% rule 2
investment(stocks) :-	savings_account(adequate),
						income(adequate).
		
% rule 3		
investment(combination) :-	savings_account(adequate),
							income(inadequate).
		
% rule 4		
savings_account(adequate) :-	amount_saved(X),
								dependents(Y),
                                minsavings(Y, MS),
								X @> MS.
								
% rule 5
savings_account(inadequate) :-	amount_saved(X),
								dependents(Y),
								minsavings(Y, MS)
                                X < MS.
			 				
% rule 6
% income(adequate) :-	earnings(X, steady),
						dependents(Y),
						minincome(Y, MI),
						X @> MI.
					
% rule 7
income(inadequate) :-	earnings(X, steady),
						dependents(Y),
						minincome(Y, MI),
                        X @< minincome(Y).
						
% rule 8
income(inadequate) :-	earnings(X, unsteady).

% rule 9
minsavings(D, MS) :-	MS is 5000 * D.

% rule 10
minincome(D, MI) :-	MI is 15000 + (4000 * D).

% rule 11
amount_saved(22000).

% rule 12
earnings(25000, steady).

% rule 13
dependents(3).


% 3 inputs required: 1 amount_saved 2 earnings, 3 dependents                

go :- 
    getAmount_saved,
    getEarnings,
    dependents,
	investment(I), nl, write('Advised investment is '), write(I), nl,
    cleanInputs.
      
getAmount_saved :-
    write('Input the amount saved '), 
    read(A), 
    assert(amount_saved(A)).
	
getEarnings :-
	write('Input the earnings '),
	read(E),
	assert(earnings(E, steady)).

dependents :-       
    write('How many dependents? '),
    read(D),
    assert(dependents(D)).
      
cleanInputs :- 
    retractall(amount_saved(_)),
    retractall(earnings(_)),
    retractall(dependents(_)).