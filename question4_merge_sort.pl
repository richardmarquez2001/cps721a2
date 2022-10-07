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

% listTerm(4, listTerm(6, listTerm(8, listTerm(10, empty_list)))), listTerm(3, listTerm(5, listTerm(7, listTerm(9, empty_list))))
mergeSortedLists(empty_list, L, L). 
mergeSortedLists(L, empty_list, L).
mergeSortedLists(listTerm(H1, T1), listTerm(H2, T2), listTerm(H1, L)) :- H1 =< H2, mergeSortedLists(T1, listTerm(H2, T2), L).
mergeSortedLists(listTerm(H1, T1), listTerm(H2, T2), listTerm(H2, L)) :- H2 < H1, mergeSortedLists(listTerm(H1, T1), T2, L).

%%%%% Helpers
% Add any additional helpers below


%%%%% RULE: mergeSort
% Add the rule(s) for mergeSort below
%  python version
% source: https://developer.nvidia.com/blog/merge-sort-explained-a-data-scientists-algorithm-guide/#:~:text=In%20the%20context%20of%20sorting,further%20to%20their%20smaller%20parts.
% def merge_sort(list: [int]):
%     list_length = len(list)
    
%     if list_length == 1:
%         return list
    
%     mid_point = list_length // 2
    
%     left_half = merge_sort(list[:mid_point])
%     right_half = merge_sort(list[mid_point:])
    
%     return merge(left_half, right_half)
% mergeSort(ListTerm, SortedListTerm) :- listLength(ListTerm, Length), Mid is Length // 2, divideList(ListTerm, Mid, LeftList, RightList), 
        
% mergeSortedLists(mergeSort)
% mergeSort(ListTerm, SortedListTerm) 

% merge(LeftList, RightList, MergedList) 



mergeSort(empty_list, empty_list).
mergeSort(ListTerm, SortedListTerm) :-
    % list_length = len(list), mid_point == list_length // 2

    % get left and right list
    divideList(ListTerm, Mid, LeftList, RightList), 

    % % left_half = merge_sort(..) , right_half = merge_sort(...)
    % mergeSort(LeftList, LeftHalf), mergeSort(RightList, RightHalf),

    % return merge(left_half, right_half)
    mergeSortedLists(mergeSort(LeftHalf), mergeSort(RightHalf), SortedListTerm).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
