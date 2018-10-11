% rule 1
investment(savings) :-	savings_account(inadequate).

% rule 2
investment(stocks) :-	savings_account(adequate),
						income(adequate).
		
% rule 3		
investment(combination) :-	savings_account(adequate),
							income(inadequate).
		
% rule 4		
% savings_account(adequate) :-	forall(amount_saved(X),
%								+(dependents(Y),
%                                greater(X, minsavings(Y))).
								
% rule 5
% savings_account(inadequate) :-	forall(amount_saved(X)),
								+(dependents(Y),
                                X > minsavings(Y)).
			 				
% rule 6
% income(adequate) :-	forall(earnings(X, steady)),
					+(dependents(Y),
                    greater(X, minincome(Y))).
					
% rule 7
% income(inadequate) :-	earnings(X, steady),
						dependents(Y),
                        X > minincome(Y).
						
% rule 8
income(inadequate) :-	earnings(X, unsteady).

% rule 9
amount_saved(X).

% rule 10
earnings(25000, steady).

% rule 11
dependents(Y).

% rule 12
minincome(X) = 15000 + (4000 * X).

% rule 13
minsavings(X) = 5000 * X.

% 3 inputs required: 1 amount_saved 2 earnings, 3 dependents                

go :- 
    getAmount_saved,
    getEarnings,
    dependents,
	income(SS), nl, write('Income is '), write(SS), nl,
    cleanInputs.
      
getAmount_saved :-
    write('Input the amount saved '), 
    read(A), 
    assert(amount_saved(A)).
	
getEarnings :-
	write('Input the earnings '),
	read(E),
	assert(earnings(E)).

dependents :-       
    write('How many dependents? '),
    read(D),
    assert(dependents(D)).
      
cleanInputs :- 
    retractall(amount_saved(_)),
    retractall(earnings(_)),
    retractall(dependents(_)).