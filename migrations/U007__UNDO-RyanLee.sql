﻿SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Altering [dbo].[WidgetPrices]'
GO
ALTER TABLE [dbo].[WidgetPrices] ALTER COLUMN [Price] [decimal] (18, 0) NULL
GO
PRINT N'Refreshing [dbo].[CurrentPrices]'
GO
EXEC sp_refreshview N'[dbo].[CurrentPrices]'
GO
PRINT N'Altering [dbo].[GetAllWidgets]'
GO
ALTER PROCEDURE [dbo].[GetAllWidgets]
AS
BEGIN
	SELECT RecordID,
           Description 
	FROM Widgets
END
GO

