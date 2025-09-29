-- Calc All Players
SELECT @TotalRecords = COUNT(*) FROM dbo.UsersTickets
Where Status IN(0,1) AND Type='QuickDraw' AND RoundsId=@RoundsId
        -- If now records End Sessin
IF @TotalRecords = 0
BEGIN
RETURN;
END
        -- Generate Secure Random Number for winner
SET @RandomIndex = ABS(CAST(CRYPT_GEN_RANDOM(4) AS INT) % @TotalRecords) + 1;
        -- Choose Records By OFFSET & FETCH
SELECT Key_1, Key_2 FROM dbo.UsersTickets
Where Status IN(0,1) AND Type='QuickDraw' AND RoundsId=@RoundsId
ORDER BY Id -- We Make ID As PrimaryKey
OFFSET (@RandomIndex - 1) ROWS FETCH NEXT 1 ROWS ONLY