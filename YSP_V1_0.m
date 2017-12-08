% YSP Script V1.0 
% Update Date: 2017/11/27 
%% NOTE
% This script is a preliminary script for the Yeast Screening
% Platform(YSP). It requires a software called Ilastik. It runs on Windows
% OS. It is not yet set up to communicate with NIS-Element. Further
% modification will be made in the future. 

%% USAGE 
% 1) Take an image of an entire well - use NIS Element JOBS 
% 2) Split the files and put it in a new folder 
% 3) Train Ilastik with one of the files - use Ilastik 
% 4) Run the following script to output a final tif files of masks that
% only show desired cells. 


%% Script - This script assumes steps 1-3 are already completed 

% run Ilastik on headless mode with the ilp file 
% the codes requires manual changing of the file path to the ilp file. 
directoryPath = 'C:\Users\Jihwan\Google Drive\PHD STUDIES_\2017-2018\COMP BIO\Project\From the microscope room'
dirArray = dir2array(directoryPath);
headlessIlastik(dirArray, directoryPath, 'using 10x_bygc1.ilp'); %New folder called Segmentation is created with the Raw Segmented files from Ilastik %have your ilp and image used for training in same directory 
RawSeg = Im2array(strcat(directoryPath,'\Segmentation')) %Read raw segmented files into array
CleanSeg = cellfun(@cleaningSegmentation, RawSeg, 'UniformOutput', false); %Cleanseg needs to be logical
ImO = Im2array(directoryPath);

[tdarray, Loc] = cellfun(@GetIntensityLocII, ImO, CleanSeg, 'UniformOutput', false)% get mean intensity and location of pixel
[final_mat_intensity, final_array_loc] = oneArray (tdarray)
number = 100 % Insert desirable number of cells that needs to be activated 
[top_ten, top_ten_loc, ids] =  rankValue (final_mat_intensity , final_array_loc, number) 
corrected_desireId = GetcorrecteIds (ids, tdarray)
Top_ten_img = cellfun(@GetDesireCell, corrected_desireId, Loc, CleanSeg, 'UniformOutput', false);
writeMask(Top_ten_img, directoryPath);