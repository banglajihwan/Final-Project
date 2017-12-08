function [final_mat_intensity, final_array_loc] = oneArray (tdarray) 
final_mat_intensity = [] 
for i = size(final_array,2) 
final_mat=[final_mat;cell2mat(final_array{i}{1})];
end

%final_array_loc = {} 
for i = size(final_array,2) 
final_array_loc = {final_array{i}{2}}
end 

