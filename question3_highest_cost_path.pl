% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: 
%%%%% NAME:
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% Helper Programs
% Put any helper programs in the space below

% THIS CODE IS CURRENTLY ABLE TO OUTPUT ALL COSTS AND PATHS, YOU JUST NEED TO IMPLEMENT A WAY TO GET THE MAX OF THEM

% dfs(+tree, +CurrentCost, +CurrentList, -Highest Cost, -Highest List)

% Base Case 1: CurrentList is empty, so CurrentCost becomes empty and the HighestCost/HighestList are 0 and [] respectively.
% Note this is only used for testing purposes (ie. empty tree), in an input that has more than one node, this case shouldn't be hit.
dfs(none, 0, [], 0, []).

% ----
% Base Case 2: Reached terminal node, compare current cost and current list to HC and HL

% Base Case 2.1: After reaching a terminal node, the cost of the path is lower than the highest. Do not update value, return previous original.
dfs(tree3(X, _, none, _, none, _, none), Cost, _, HC, _) :- Cost < HC.

% Base Case 2.2: 
dfs(tree3(X, _, none, _, none, _, none), Cost, [X|A], HC, _) :- Cost >= HC, dfs(none, _, _, Cost, [X|A]).

% Recursive Clause 1: Recurse through the left subtree
dfs(tree3(X, LC, L, _, _, _, _), Cost, [X|A], HC, HL) 
        :- dfs(L, NewCost, A, HC, HL), Cost is NewCost + LC.

% Recursive Clause 2: Recurse through the middle subtree
dfs(tree3(X, _, _, MC, M, _, _), Cost, [X|A], HC, HL) 
        :- dfs(M, NewCost, A, HC, HL), Cost is NewCost + MC.

% Recursive Clause 3: Recurse through the right subtree
dfs(tree3(X, _, _, _, _, RC, R), Cost, [X|A], HC, HL) 
        :- dfs(R, NewCost, A, HC, HL), Cost is NewCost + RC.



% Clause 1: Current Cost is less than the CVal, nothing changes.
% checkMax(CurrentCost, CurrentList, HighestCost, HighestList) :- CurrentCost < HighestCost.

% Clause 2: Current cost is greater than HighestCost, call checkMax again with the updated values.
% checkMax(CurrentCost, CurrentList, HighestCost, CurrentList) :- CurrentCost >= HighestCost, checkMax(_, _, CurrentCost, CurrentList).

%%%%% RULE: highestCostPath
% Add the rule(s) for highestCostPath below
highestCostPath(T, PC, PL) :- 
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
