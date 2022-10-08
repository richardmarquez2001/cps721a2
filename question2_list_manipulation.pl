% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Richard Marquez 500952090
%%%%% NAME:
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% RULE: listMap
% Add the rule(s) for part a below
listMap([Key|_], [Value|_], Key, Value).
listMap([_|T1], [_|T2], Key, Value) :- listMap(T1, T2, Key, Value).

%%%%% RULE: encodeList  
% Add the rule(s) for part b below
encodeList([], _, _, []).
encodeList([H|T], V, K, [H1|L]) :- listMap(V, K, H, H1), encodeList(T, V, K, L).

%%%%% RULE: consecutiveCount
%  Add the rule(s) for part c below 
consecutiveCount([_], 0).
consecutiveCount([X, Y|T], Count) :- X=Y, consecutiveCount([Y|T], NewCount), Count is NewCount + 1.
consecutiveCount([X, Y|T], Count) :- not X=Y, consecutiveCount([Y|T], Count). 

%%%%% RULE: splitOnInt
%  Add the rule(s) for part d below 
splitOnInt([], _, [], []).
splitOnInt([H|T], V, [H|S], L) :- V >= H, splitOnInt(T, V, S, L).
splitOnInt([H|T], V, S, [H|L]) :- V < H, splitOnInt(T, V, S, L).

%%%%% RULE: incAverage
% Add the rule(s) for part e below
incAverage([],0,0).
incAverage([H|T], Av, Num) :- incAverage(T, NewAvg, NewNum), Num is NewNum + 1, Av is (NewAvg + ((H - NewAvg) / (NewNum + 1))). 

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
