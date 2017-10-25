CREATE PROCEDURE [dbo].[Orders_Upsert]
	@CustomerId INT
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO dbo.Orders(CustomerId)
	VALUES (@CustomerId)

END
