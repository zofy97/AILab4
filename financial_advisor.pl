savings_account(adequate).
savings_account(inadequate).
income(adequate).
income(inadequate).

investment(savings) :-	savings_account(inadequate).

investment(stocks) :-	savings_account(adequate),
						income(adequate).
						
investment(combination) :-	savings_account(adequate),
							income(inadequate).