-- Update Winners Amount By Prize calc
UPDATE t
SET 
    t.status = 2,
    t.Win = w.Stage,
    t.Win_Amount = pd.PrizePerWinner,
    t.Edate = @CurrentUnixTime
FROM dbo.UsersTickets t
INNER JOIN (
    SELECT 
        t.Id,
        CASE 
            WHEN r.Key_1 = t.Key_1 AND r.Key_2 = t.Key_2 THEN 1
            WHEN r.Key_3 = t.Key_1 AND r.Key_4 = t.Key_2 THEN 2
            WHEN r.Key_5 = t.Key_1 AND r.Key_6 = t.Key_2 THEN 3
        END as Stage
    FROM dbo.UsersTickets t
    INNER JOIN dbo.RoundsItem r ON t.RoundsId = r.ID
    WHERE t.RoundsId = @RoundId
      AND t.status IN (0, 1)
      AND r.Key_1 <> '0'
) w ON t.Id = w.Id
INNER JOIN dbo.PrizeDistribution pd ON pd.RoundsId = @RoundId AND pd.Stage = w.Stage
WHERE w.Stage IS NOT NULL;