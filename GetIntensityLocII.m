function [tdarray, Loc] =GetIntensityLocII (image_file, mask_file)  
%image_file = '10x_bygc1.tif'
%mask_file = '10x_bygc1.tif-mask.tif'
%I = imread(fileName);
%immask = imread(mask_file);

cell_properties = regionprops (mask_file, image_file, 'MeanIntensity', 'PixelIdxList', 'Image');
 MI = {cell_properties.MeanIntensity};
 Loc = {cell_properties.PixelIdxList};
 
 tdarray{1} = MI;
 tdarray{2} = Loc; 
 
 