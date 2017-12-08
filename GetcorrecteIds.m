function corrected_desireId = GetcorrecteIds (ids, tdarray)
ids_sort = sort(ids); 
for m = 1:size(tdarray,2) 
    maxiIds(m) = size(tdarray{m}{1},2)
end 
for id = 1:size(maxiIds,2)
upperbound(id) = sum(maxiIds(1:id));
end 

for n = 1:size(tdarray,2)
    if n ==1 
desireId{n} = find (ids_sort <=upperbound(n));
    else 
desireId{n} = find( upperbound(n-1)<ids_sort & ids_sort<=upperbound(n));
    end 
end 

for n =1:size(tdarray,2)
    if size(desireId{n},1)==0 
        corrected_desireId{n} = 0;
    else
        if n == 1 
            corrected_desireId{n} = desireId{n};
        else 
        corrected_desireId{n} = ids_sort(desireId{n})-upperbound(n-1);
        end 
    end 
end 


