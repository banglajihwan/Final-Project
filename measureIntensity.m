function [MI, Loc] = measureIntensity (image_file, mask_file)  
%image_file = '10x_bygc1.tif'
%mask_file = '10x_bygc1.tif-mask.tif'
%I = imread(fileName);
%immask = imread(mask_file);

cell_properties = regionprops (mask_file, image_file, 'MeanIntensity', 'PixelIdxList', 'Image');
MI = [cell_properties.MeanIntensity]
Loc ={cell_properties.PixelIdxList}

%MI_sort = sort(MI, 'descend');
%Top_ten = MI_sort(1:20); 
%for i = 1:size(Top_ten,2)
 %ids(i) = find(MI == Top_ten(i)); 
%end 
%Top_ten_img = false(size(mask_file)); 
%for j = 1:size(ids,2)
%Top_ten_img(cell_properties(ids(j)).PixelIdxList) = true; 
%end 
%imshow(Top_ten_img);
