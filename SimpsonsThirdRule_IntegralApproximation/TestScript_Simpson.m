clear;clc;close all
%Ilari Pajula 715586

A = dlmread('Data_set1.txt','\t',3,0);
x = transpose(A(:,2));
y = transpose(A(:,3));
a = max(x);
b = min(x);


A2 = dlmread('Data_set2.txt','\t',3,0);
x2 = transpose(A2(:,2));
y2 = transpose(A2(:,3));
a2 = max(x2);
b2 = min(x2);

IDataSet1 = Simpson(x,y,a,b);
IDataSet2 = Simpson(x2,y2,a2,b2);

disp('IDataSet1 = ')
disp(IDataSet1)
disp('IDataSet2 = ')
disp(IDataSet2)

