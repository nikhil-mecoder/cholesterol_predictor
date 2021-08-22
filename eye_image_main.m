clear all;
close all;
clc;
%% Load Image
prompt = 'Image no.?\n';
n = input(prompt);
image(n)
function image(n) 
imds = imageDatastore("C:\Nikhil_kashyap\IIT JODHPUR  DOCS\Summer Term Project\Camera","FileExtensions",{'.jpg'});
a = imread(imds.Files{n});
%% Crop Image
b = imcrop(a);
c = rgb2gray(b);
d = imresize(c,[660 600]);
imshow(d)
imSz = size(d);
%% Patch Generation
patchSz = [64 64];
xIdxs = [1:patchSz(2):imSz(2) imSz(2)+1];
yIdxs = [1:patchSz(1):imSz(1) imSz(1)+1];
patches = cell(length(yIdxs)-1,length(xIdxs)-1);
for i = 1:length(yIdxs)-1
    Isub = d(yIdxs(i):yIdxs(i+1)-1,:,:);
    for j = 1:length(xIdxs)-1
        patches{i,j} = Isub(:,xIdxs(j):xIdxs(j+1)-1,:);
    end
end

e = [patches{4,1};patches{5,1};patches{6,1};patches{7,1}...
    ;patches{4,10}';patches{5,10}';patches{6,10}';patches{7,10}'];
imshow(e);
%% Gray level co-occurance matrix feature detection
offsets = [-2 2];
glcm = graycomatrix(e,"offset",offsets);
stats = graycoprops(glcm);
table = struct2table(stats);
contrast = table.Contrast;
correlation = table.Correlation;
Energy = table.Energy;
Homegeneity = table.Homogeneity;

%% Prediction of Cholesterol
[y_predicted] = prediction(correlation)
end



