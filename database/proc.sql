USE [former]
GO
/****** Object:  StoredProcedure [dbo].[customer_expense]    Script Date: 11/27/2023 8:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[customer_expense] (@month INT, @year INT, @amount BIGINT) AS
	IF @year < 0 OR @month < 0 OR @month > 12
	BEGIN
		PRINT 'INVALID DATE ENTERED';
		RETURN 0;
	END;
	IF @amount < 0
	BEGIN
		PRINT 'INVALID AMOUNT OF EXPENSE';
		RETURN 0;
	END;
	SELECT		c.*, sum(b.total_cost) AS Total
	FROM		bill AS b JOIN customer AS c ON b.cus_id = c.cus_id
	WHERE		b.pay_status = 1 AND DATEPART(mm,b.bill_datetime) = @month AND DATEPART(yyyy,b.bill_datetime) = @year
	GROUP BY	c.cus_id, c.cus_name, c.phone_num, c.account_id, c.loyalty_point
	HAVING		sum(b.total_cost) > @amount
	ORDER BY	Total DESC;
GO
/****** Object:  StoredProcedure [dbo].[staff_age_above]    Script Date: 11/27/2023 8:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------FIRST PROCEDURE------------------
-- SHOW LIST OF STAFFS, WHOSE AGES (COUNT ON YEAR) ARE BELOW A CERTAIN AGE (@year), AT RESTAURANTS IN PARTICULAR PROVINCE(@prov) --

CREATE OR ALTER PROCEDURE staff_age_in_range (@agestart INT,@ageend INT,@prov NVARCHAR(50)) AS
	IF @agestart < 0 OR @ageend > 100 OR @agestart >= @ageend
	BEGIN
		PRINT 'INVALID AGE ENTERED';
		RETURN 0;
	END;
	SET			@agestart = DATEPART(yyyy, GETDATE()) - @agestart;
	SET			@ageend = DATEPART(yyyy, GETDATE()) - @ageend;
	SELECT		s.*
	FROM		dbo.staff AS s JOIN dbo.restaurant AS r ON s.res_id = r.res_id
	WHERE		DATEPART(yyyy,s.date_of_birth) <= @agestart
				AND DATEPART(yyyy, s.date_of_birth) >= @ageend
				AND r.province = @prov
	ORDER BY	s.date_of_birth;
GO
