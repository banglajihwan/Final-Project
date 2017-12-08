function headlessIlastik(fileName, directoryPath, ilpfilename) 
% input cell array with a string of the name of the file that you want to
% analzye, 
directoryPathIlas = strcat('"',directoryPath,'\',ilpfilename,'"'); %make sure you have one .ilp file in you working directory. 


%export_mode = '--export_source="Simple Segmentation" --output_format=tif'
callheadless = '"C:\Program Files\ilastik-1.2.2post1\run-ilastik.bat"' %locate where to call headless i.e. file where ilastik is installed
mode = '--headless'

project = strcat('--project=',directoryPathIlas); 
export_source = '--export_source="Simple Segmentation"'
export_format = '--output_format=tif'
Combine = {callheadless, mode, project, export_source, export_format, strjoin(fileName)};


%Character = {'"C:\Program Files\ilastik-1.2.2post2\run-ilastik.bat" --headless --project="H:\Images\Yeast-James and Peter\Screening coding images\0.2ul_EGFP-P2A-mCherry with BYG\Split _GFP\using 10x_bygc1.ilp" --export_source="Simple Segmentation" --output_format=tif', strjoin(fileName)};
Input = strjoin(Combine) 
system(Input); 
mkdir('Segmentation'); 
movefile(strcat(directoryPath,'\*Simple Segmentation.tif') , strcat(directoryPath,'\Segmentation'), 'f');
%cd ('H:\Images\Yeast-James and Peter\Screening coding images')
end 