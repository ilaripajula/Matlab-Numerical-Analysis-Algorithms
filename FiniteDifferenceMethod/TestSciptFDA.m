close all
clc;clear;
%Ilari Pajula 715586
%Test Script For Reading From File, with .txt provided
fileID = fopen('Assigment_2_Week5_xy_Data.txt','r');
formatSpec = '%f %f';
sizeA = [2 Inf];
data = fscanf(fileID,formatSpec,sizeA);
X = data(1,:);
y = data(2,:);

[fx, fxx] = fda(X,y);
