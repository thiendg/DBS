
-- Sample staff_age_in_range proc --
EXEC [dbo].[staff_age_in_range] 18, 20, 'Dong Nai'; -- Find staffs who are between 18 and 20, working in 'Dong Nai' province
EXEC [dbo].[staff_age_in_range] 20, 25, 'TPHCM';
EXEC [dbo].[staff_age_in_range] 18, 40, 'Dong Nai';
EXEC [dbo].[staff_age_in_range] -10, 0, 'Hai Phong';	-- Inacceptable age inputed -> Error Message, No result
GO


-- Sample customer_expense proc --
EXEC customer_expense 11, 2023, 150000;		-- Find the customer spent more than 150000 in November 2023
EXEC customer_expense 10, 2020, 100000;
EXEC customer_expense 15, 1999, -100;		-- Minus value transferred to proc -> Error message, No result


-- Sample 

SELECT * FROM BILL;