-- Step 1 Found Winners Player 

WITH WinnerCounts AS (
    SELECT 
        Stage,
        COUNT(*) as WinnerCount,
        CASE Stage 
            WHEN 1 THEN SUM(r.Prize)
            WHEN 2 THEN SUM(r.Prize2) 
            WHEN 3 THEN SUM(r.Prize3)
        END as TotalPrize
    FROM (
        SELECT 
            t.Id,
            t.Round_Id,
            CASE 
                WHEN r.Key_1 = t.Key_1 AND r.Key_2 = t.Key_2 THEN 1
                WHEN r.Key_3 = t.Key_1 AND r.Key_4 = t.Key_2 THEN 2
                WHEN r.Key_5 = t.Key_1 AND r.Key_6 = t.Key_2 THEN 3
            END as Stage
        FROM dbo.Tickets t
        INNER JOIN dbo.TicketRounds r ON t.RoundsId = r.ID
        WHERE t.RoundsId = @RoundId
          AND t.status IN (0, 1)
          AND r.Key_1 <> '0'
          AND (
              (t.Type NOT IN (5, 10) AND (
                  (r.Key_1 = t.Key_1 AND r.Key_2 = t.Key_2) OR
                  (r.Key_3 = t.Key_1 AND r.Key_4 = t.Key_2) OR
                  (r.Key_5 = t.Key_1 AND r.Key_6 = t.Key_2)
              )) OR
              (t.Type IN (5, 10) AND r.Key_1 = t.Key_1 AND r.Key_2 = t.Key_2)
          )
    ) winners
    INNER JOIN dbo.RoundsItems r ON winners.RoundsId = r.ID
    WHERE winners.Stage IS NOT NULL
    GROUP BY winners.Stage
)