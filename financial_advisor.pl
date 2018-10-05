savings_account(adequate).
savings_account(inadequate).
income(adequate).
income(inadequate).

% rule 1
investment(savings) :-	savings_account(inadequate).

% rule 2
investment(stocks) :-	savings_account(adequate),
						income(adequate).
		
% rule 3		
investment(combination) :-	savings_account(adequate),
							income(inadequate).
		
% rule 4		
savings_account(adequate) :-	forall(amount_saved(X)),
								+(dependents(Y), +(greater(X, minsavings(Y)))).
								
% rule 5
savings_account(inadequate) :-	forall(amount_saved(X)),
								+(dependents(Y), \+(greater(X, minsavings(Y))).
								
% rule 6
income(adequate) :-	forall(earnings(X, steady)),
					+(dependents(Y), +(greater(X, minincome(Y)))).
					
% rule 7
income(inadequate) :-	forall(earnings(X, steady)),
						+(dependents(Y), \+(greater(X, minincome(Y)))).
						
% rule 8
income(inadequate) :-	forall(earnings(X, unsteady)).

% rule 9
amount_saved(22000).

% rule 10
earnings(25000, steady).

% rule 11
dependents(3).