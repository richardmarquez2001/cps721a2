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

%%%%% RULE: listLength
% Add the rule(s) for listLength below
listLength(empty_list, 0).
listLength(listTerm(_, T), Length) :- listLength(T, NewLength), Length is NewLength + 1.

%%%%% RULE: divideList
% Add the rule(s) for divideList below
divideList(L, 0, empty_list, L).
divideList(listTerm(H, T), N, listTerm(H, F), L) :- divideList(T, N1, F, L), N is N1 + 1.

%%%%% RULE: mergeSortedLists
% Add the rule(s) for mergeSortedLists below
mergeSortedLists(empty_list, L, L). 
mergeSortedLists(L, empty_list, L).
mergeSortedLists(listTerm(H1, T1), listTerm(H2, T2), listTerm(H1, L)) :- H1 =< H2, mergeSortedLists(T1, listTerm(H2, T2), L).
mergeSortedLists(listTerm(H1, T1), listTerm(H2, T2), listTerm(H2, L)) :- H2 < H1, mergeSortedLists(listTerm(H1, T1), T2, L).

%%%%% Helpers
% Add any additional helpers below


%%%%% RULE: mergeSort
% Add the rule(s) for mergeSort below

% Base Case 1: The list is empty, so you return an empty list.
mergeSort(empty_list, empty_list).

% Base Case 2: The list has only one element, so you return the list.
mergeSort(listTerm(H, empty_list), listTerm(H, empty_list)).

% Recursive Case
mergeSort(listTerm(H, T), SortedList) 

    % Get the midpoint and divide the list into two halves.
    :- listLength(listTerm(H, T), List), Mid is List // 2, divideList(listTerm(H, T), Mid, FirstHalf, SecondHalf), 
        
    % Recursively call mergeSort on the two halves.
    mergeSort(FirstHalf, FirstHalfOutput), mergeSort(SecondHalf, SecondHalfOutput), 
        
    % Merge the two halves together.
    mergeSortedLists(FirstHalfOutput, SecondHalfOutput, SortedList).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
