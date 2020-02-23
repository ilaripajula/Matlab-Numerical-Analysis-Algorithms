clc;clear;close all
syms x y z

f1 = x^(2)*y*z +y^(2)*z - 3*z^(4);
f2 = x - 1/y + z^(3)*x;
f3 = y*x + y*z + x*z;

f = [f1,f2,f3];
vars = [x,y,z];

J = jacobian(f,vars);

disp('Jacobian Matrix of f1, f2, f3: ')
disp(J)