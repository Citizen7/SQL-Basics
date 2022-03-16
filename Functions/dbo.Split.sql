/* Split
-- This function splits a string on a given delimiter.
*/
CREATE FUNCTION [dbo].[Split]
(
    @ToSplit nvarchar(max),
    @Delimiter char(1) = ','
)
RETURNS @Result table (
    Item nvarchar(1000)
)
AS
    BEGIN
    DECLARE @StartIndex int, @EndIndex int
    SET @StartIndex = 1
    IF SUBSTRING(@ToSplit, LEN(@ToSplit) -1, LEN(@ToSplit)) <> @Delimiter
    BEGIN
    SET @ToSplit = @ToSplit + @Delimiter
    END
    WHILE CHARINDEX(@Delimiter, @ToSplit) > 0
    BEGIN
    SET @EndIndex = CHARINDEX(@Delimiter, @ToSplit)
    INSERT INTO @Result(Item)
    SELECT SUBSTRING(@ToSplit, @StartIndex, @EndIndex -1)
    SET @ToSplit = SUBSTRING(@ToSplit, @EndIndex + 1, LEN(@ToSplit))
    END
    RETURN
END