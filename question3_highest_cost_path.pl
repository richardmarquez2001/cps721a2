% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Richard Marquez 500952090
%%%%% NAME: Ethan Hou 500962917
%%%%% NAME: Benjamin Nguyen 500952090
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% Helper Programs
% Put any helper programs in the space below

% simple program to check whether X is bigger than Y and Z.
isBigger(X, Y, Z) :- X >= Y, X >= Z.

%%%%% RULE: highestCostPath
% Add the rule(s) for highestCostPath below

% Base Case: If the path is empty, return 0 and an empty list.
highestCostPath(none, 0, []).

% Recursive Case 1: The left path contains the highest cost path.
highestCostPath(tree3(X, LC, L, MC, M, RC, R), Cost, [X|LPList]) :-

    % Recurse through the children
    highestCostPath(L, LPCost, LPList), highestCostPath(M, MPCost, _), highestCostPath(R, RPCost, _),
    
    % Check if the cost of the left path is the biggest of the three
Cost is LPCost + LC, isBigger(Cost, MPCost + MC, RPCost + RC).
    

% Recursive Case 2: The middle path contains the highest cost path.
highestCostPath(tree3(X, LC, L, MC, M, RC, R), Cost, [X|MPList]) :-
    
    % Recurse through the children
    highestCostPath(L, LPCost, _), highestCostPath(M, MPCost, MPList), highestCostPath(R, RPCost, _),
    
    % Check if the cost of the middle path is the biggest of the three
    Cost is MPCost + MC, isBigger(Cost, LPCost + LC, RPCost + RC).
    

% Recursive Case 3: The right path contains the highest cost path.
highestCostPath(tree3(X, LC, L, MC, M, RC, R), Cost, [X|RPList]) :-
    
    % Recurse through the children
    highestCostPath(L, LPCost, _), highestCostPath(M, MPCost, _), highestCostPath(R, RPCost, RPList),

    % Check if the cost of the right path is the biggest of the three
    Cost is RPCost + RC, isBigger(Cost, LPCost + LC, MPCost + MC).

%%%%% TESTS
% Below is a test tree, based on the diagram in the assignment
% You can use it in a query as follows:
%
% ?- testTree(1, X), highestCostPath(X, Cost, Path).
%
% You may also add additional tree below for testing in this way, though we will not mark them.

testTree(1, 
    tree3(a,  % The root node has name a
            2, tree3(b, % Left child of a is b and can be reached with cost 2 
                    3, tree3(e,0, none, 0, none, 0, none),   % Left child of b is e. It is a leaf node
                    5, tree3(f, 0, none, 0, none, 0, none),   % Middle child of b is f. It is a leaf node
                    0, none  % There is no right childe of b
                    ),
            3, tree3(c, 0, none, 0, none, 0, none),  % Middle child of a is c. It is a leaf node
            1, tree3(d,   % Right child of a is d
                    2, tree3(g, 0, none, 0, none,   % Left child of d is g. It has no left or middle child
                            1, tree3(h, 0, none, 0, none, 0, none)),   % The right child of g is h. It is a leaf node
                    0, none, 0, none  % d has no middle or right children
                    )
        )
).
%%%%% END
% DO NOT PUT ANY LINES BELOW
