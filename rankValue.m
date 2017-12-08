function [top_ten, top_ten_loc, ids] =  rankValue (MI , final_array_loc, number) 
MI_sort = sort(MI, 'descend');
 top_ten = MI_sort(1:number); 
for i = 1:size(top_ten,1)
    %if size(find(MI == top_ten(i)), 1) > 1 
        %a = find(MI == top_ten(i))
        %ids(i) = a(1)
    %else 
        ids(i) = find(MI == top_ten(i));  % there could be two values with same intensity 
    %end 
    end 
ids = ids';

for j = 1:size(ids,1)
top_ten_loc{j} = final_array_loc{ids(j)}
end 
top_ten_loc = top_ten_loc'