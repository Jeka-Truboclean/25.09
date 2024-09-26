CREATE TABLE Inventory (
    ID INT IDENTITY(1,1) PRIMARY KEY,      
    Name NVARCHAR(255) NOT NULL,          
    Quantity INT NOT NULL,                
    Status NVARCHAR(50) NOT NULL           
);
GO


CREATE PROCEDURE AddInventoryItem
    @ObjectName NVARCHAR(255),
    @ObjectQuantity INT,
    @ObjectStatus NVARCHAR(50),
    @ObjectID INT OUTPUT
AS
BEGIN
    INSERT INTO Inventory (Name, Quantity, Status)
    VALUES (@ObjectName, @ObjectQuantity, @ObjectStatus);
    SET @ObjectID = SCOPE_IDENTITY();
    RETURN;
END;
GO

DECLARE @NewObjectID INT;

EXEC AddInventoryItem 
    @ObjectName = 'Ноутбук Dell',
    @ObjectQuantity = 10,
    @ObjectStatus = 'В наличии',
    @ObjectID = @NewObjectID OUTPUT;

SELECT @NewObjectID AS 'New Object ID';