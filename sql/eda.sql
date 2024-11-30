SELECT g.eco, r.status_name, COUNT(*) AS count
FROM public.games g
JOIN game_result AS r ON g.game_result = r.result_id
GROUP BY g.eco, r.status_name
ORDER BY count desc;


SELECT * FROM public.moves
ORDER BY game_id ASC 

SELECT eco, COUNT(*) as count FROM Games GROUP BY eco
SELECT 	eco, 
		COUNT(*) as count, 
		'white' AS player_color 
FROM Games 
GROUP BY eco UNION ALL 	
SELECT 	eco, 
		COUNT(*) as count, 
		'black' AS player_color 
FROM Games GROUP BY eco


SELECT 
    eco, 
    CASE 
        WHEN winner = white THEN 'White Win'
        WHEN winner = black THEN 'Black Win'
        ELSE 'Draw'
    END AS outcome,
    COUNT(*) AS count
FROM 
    Games
GROUP BY 
    eco, outcome
ORDER BY 
    count desc;

SELECT 
    move_number,
    AVG(
        no_white_pawns * 1 +
        no_white_knights * 3 +
        no_white_bishops * 3 +
        no_white_rooks * 5 +
        no_white_queens * 9
    ) AS avg_white_score,
    AVG(
        no_black_pawns * 1 +
        no_black_knights * 3 +
        no_black_bishops * 3 +
        no_black_rooks * 5 +
        no_black_queens * 9
    ) AS avg_black_score
FROM 
    Moves
GROUP BY 
    move_number
ORDER BY 
    move_number;
	