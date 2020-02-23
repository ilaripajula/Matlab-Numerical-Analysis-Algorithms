clc;clear;close all

syms x y
f1 =  x^2 + y^2 - 6;
f2 = x*y -1;

%INITIAL GUESS and SYMMETRY
%knowing that f1 is a function for a circle with radius sqrt(6),
%and knowing f2 is a hyperbola with asymptotes at x=y=0,
%We can expect 4 symmetric roots. Can be discovered by plotting.
%Make initial guesses one of the intersections on positive x-y axis.

x1 = sqrt(6); 
y1 = 0;

roots = newtonsMethod([f1,f2],[x,y],x1,y1);
dec = vpa(roots);

fprintf('Intersections found using symmetry:\n\r(%f, %f,)\n\r(%f, %f,)\n\r(%f, %f,)\n\r(%f, %f,)',...
    dec(2),dec(1),dec(1),dec(2),-dec(1),-dec(2),-dec(2),-dec(1))

function roots = newtonsMethod(func,var,x1,y1)
%func, handle to [] of functions in symbolic form
%var, [] of variables to form jacobian matrix
%x1, initial guess for x intersect point
%y2, inital guess for y intersect point

Jsymb = jacobian(func,var); %create jacobian
for i = 1:6 %goes to n = 5 iterations
    J = subs(Jsymb,var,[x1,y1]); %evaluate jacobian with x1,y1
    F = transpose(subs(func,var,[x1,y1])); %evaluate F with x1,y1
    a = linsolve(J,F); %solve for delta x and y 
    x1 = x1- a(1,1); %update x1
    y1 = y1 - a(2,1); %update y1
end

roots = [x1,y1];

end