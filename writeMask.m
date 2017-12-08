function writeMask(Top_ten_img, directoryPath)

for i = 1:size(Top_ten_img, 2)
    if Top_ten_img{i} == 0 
         
    else 
        imwrite(Top_ten_img{i}, strcat(num2str(i),'mask','.tif'));
    end 
end 
mkdir 'Mask' 
movefile(strcat(directoryPath,'\*mask.tif') , strcat(directoryPath,'\Mask'), 'f');
 
