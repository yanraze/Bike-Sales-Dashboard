Select convert(date, Date) as date
From DAProject..Bike_sales


Update Bike_sales
Set Date = CAST(Date AS DATE)
Go

Select Date
From Bike_sales

BEGIN TRANSACTION;  -- Start the transaction

UPDATE Bike_sales
SET Date = convert(date, Date);

-- Check for errors or unexpected results here.  For example:
-- SELECT * FROM Bike_sales WHERE ...;

IF @@ERROR = 0  -- Check if any errors occurred during the UPDATE
BEGIN
    COMMIT TRANSACTION;  -- If no errors, commit the changes
    PRINT 'Update successful. Transaction committed.';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION; -- If errors, rollback the changes
    PRINT 'Update failed. Transaction rolled back.';
END;

Select Date
From Bike_sales