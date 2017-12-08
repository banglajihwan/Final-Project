function Top_ten_img = GetDesireCell (corrected_desireId, Loc, imClean)

if corrected_desireId == 0     
Top_ten_img = false(size(imClean)); 
else
%for j = 1:size(corrected_desireId,2)
Top_ten_img = false(size(imClean));
Top_ten_img(cell2mat(Loc(corrected_desireId)')) = true; 
end 
end 


