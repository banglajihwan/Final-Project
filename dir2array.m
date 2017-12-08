function dirArray = dir2array(directoryPath); 
% directoryPath as string with the split image of an well. 
cd 
tif_files = strcat(directoryPath,'\*.tif');
dirArray = ls (tif_files);
dirArray= cellstr(dirArray);
end 