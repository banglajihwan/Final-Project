function cleanMask=cleaningSegmentation(imread_files) 
% convert files to black and white. 
data_trans=imread_files;
data_trans(data_trans == 1) = 1;%1 is cell 
data_trans(data_trans == 2 )= 0;%2 is background


% Eliminate too big or too small i.e. greater than 2sd of average cell
% size. 
cc2 = bwconncomp(data_trans); % we need to call this function to consider connected pixels. 
stats0 = regionprops(cc2, 'Area', 'Centroid', 'Image', 'PixelIdxList');
allArea = [stats0.Area];
%hist(allArea,200) % you can graph the histogram to see the distribution
% of area 
unacceptedArea =  allArea < 30;
sublist = cc2.PixelIdxList(unacceptedArea);
sublist = cat(1, sublist{:}); 
data_trans(sublist) = 0;  % this converts the pixel id of unaccepted Area to 0. 

cleanMask= imfill(data_trans, 'holes'); %fills up holes in mask
cleanMask = logical(cleanMask); 

%Apply watershed NOT working well 
%CC = bwconncomp(data_t_close);
%state = regionprops(CC, 'Area');
%area = [state.Area];
%fusedCandidates = area > mean(area) + std(area); 
%sublist = CC.PixelIdxList(fusedCandidates); 
%sublist = cat(1,sublist{:});
%fusedMask = false(size(data_t_close));
%fusedMask(sublist) = 1; 
%s = round(1.2*sqrt(mean(area))/pi);
%nucmin =imerode(fusedMask, strel('disk', s));
%outside = ~imdilate(fusedMask,strel('disk',1));
%basin =imcomplement(bwdist(outside));
%basin = imimposemin(basin, nucmin|outside);
%pcolor(basin); shading flat; 
%L = watershed(basin);  

%output
%cleanMask = L >1 | (data_t_close - uint8(fusedMask));
