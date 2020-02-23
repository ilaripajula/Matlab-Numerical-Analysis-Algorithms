function I = Simpson(X,Y,a,b)
%Ilari Pajula 715586
%x - data for x-points needs to be in form [x1, x2 ,...,xn]
%y - data for y-points needs to be in form [y1,y2,
%a - upper limit
%b - lower limit

B = [X;Y];
%Bound the terms first given a and b
ymax = find(B(1,:)==a);
ymin = find(B(1,:)==b);
Y= B(2,:);
y = Y(ymin:ymax);

%initialize important terms
i = 1;
h = X(2)-X(1);
I = 0;
n = length(y);
coef = 4;

%If even points do 3/8 rule first
if mod(n,2) ~= 1
    I = (y(1)+3*y(2)+3*y(3)+y(4))*((3*h)/8);
    i = 4;
end
%rest done with 1/3 rule
I2 = y(i);
for a = i+1:1:n-1
    I2 = I2 + (coef*y(a));
    if coef == 4
        coef = 2;
    else
        coef = 4;
    end
end
I2 = I2 + y(n);
I2 = I2*(h/3);

I = I + I2;
end



