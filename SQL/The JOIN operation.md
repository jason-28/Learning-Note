# [The JOIN operation](https://sqlzoo.net/wiki/The_JOIN_operation)

## Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

    SELECT  matchid,player FROM goal 
    WHERE teamid = 'GER'
