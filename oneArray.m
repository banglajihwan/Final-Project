function [final_mat_intensity, final_array_loc] = oneArray (tdarray) 
final_mat_intensity = []; 
for i = 1:size(tdarray,2) 
final_mat_intensity=[final_mat_intensity; (cell2mat(tdarray{i}{1}))'];
end

final_array_loc = {} 
for i = 1:size(tdarray,2)
final_array_loc = cat(2,final_array_loc, tdarray{i}{2});
end 
final_array_loc = final_array_loc'

