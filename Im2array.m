function Im = Im2array(directory)
%directory in string that stores segmented files 
f=dir(strcat(directory,'\*.tif'));
files={f.name};
for k=1:numel(files)
  Im{k}=imread(files{k});
end
end 