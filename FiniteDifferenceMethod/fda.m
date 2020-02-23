function [dx,dxx] =  fda(X,y)
%Ilari Pajula 715586
%Week 5 Assignment 2
np=length(X);

if np >=5 && np == length(y)

h = X(2)-X(1);
%Forward FDA Calculations pre-loop
dx(1)=(-y(3)+4*y(2)-3*y(1))/(2*h);
dxx(1)=(-y(4)+4*y(3)-5*y(2)+2*y(1))/(h^2);

for i=2:np-1
    
    %Looped Central FDA calculations
    dx(i)=(y(i+1)-y(i-1))/(2*h);
    dxx(i)=(y(i+1)-2*y(i)+y(i-1))/(h^2);
        
end

%Backward FDA calculations post-loop
dx(np)=(3*y(np)-4*y(np-1)+y(np-2))/(2*h);
dxx(np)=(2*y(np)-5*y(np-1)+4*y(np-2)-y(np-3))/(h^2);

else 
    disp('Enter xy data with at least 5 data points.')
end

end