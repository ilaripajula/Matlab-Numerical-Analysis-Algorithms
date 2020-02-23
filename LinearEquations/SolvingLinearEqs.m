% Excersize 1 Week 2

A = [1 0 0 10;0 1 0 14;0 0 1 19;0 0 -1 6];
F1 = (10*9.81*sin(pi/4))-(10*0.25*9.81*cos(pi/4));
F2 = (4*9.81*sin(pi/4))-(4*0.3*9.81*cos(pi/4));
F3 = (5*9.81*sin(pi/4))-(5*0.2*9.81*cos(pi/4));
F4 = (6*9.81);
b = [F1;F1+F2;F1+F2+F3;-F4];

%LU Decomposition
LU_x = LUsol(LUdec(A),b);

%Gaussian
Gauss_x = gauss(A,b);

%Gauss Jordan
Gauss_Jordan_x = gaussPiv(A,b);

function v = swapRow(v,i,j)
% Swap rows i and j of vector or matrix v.
% USAGE: v = swapRows(v,i,j)
temp = v(i,:);
v(i,:) = v(j,:);
v(j,:) = temp;
end

function A = LUdec(A)
% LU decomposition of matrix A; returns A = [L\ U].
% USAGE: A = LUdec(A)
n = size(A,1);
for k = 1:n-1
    for i = k+1:n
        if A(i,k) ~= 0.0
            lambda = A(i,k)/A(k,k);
            A(i,k+1:n) = A(i,k+1:n) - lambda*A(k,k+1:n);
            A(i,k) = lambda;
        end
    end
end
end

function x = LUsol(A,b)
% Solves L*U*x = b, where A contains both L and U;
% that is, A has the form [L\U].
% USAGE: x = LUsol(A,b)
if size(b,2) > 1; b = b'; end
n = length(b);
for k = 2:n
    b(k) = b(k) - A(k,1:k-1)*b(1:k-1);
end
for k = n:-1:1
    b(k) = (b(k) - A(k,k+1:n)*b(k+1:n))/A(k,k);
end
x = b;
end

function [x,det] = gauss(A,b)
% Solves A*x = b by Gauss elimination and computes det(A).
% USAGE: [x,det] = gauss(A,b)
if size(b,2) > 1; b = b'; end % b must be column vector
n = length(b);
for k = 1:n-1 % Elimination phase
    for i= k+1:n
        if A(i,k) ~= 0
            lambda = A(i,k)/A(k,k);
            A(i,k+1:n) = A(i,k+1:n) - lambda*A(k,k+1:n);
            b(i)= b(i) - lambda*b(k);
        end
    end
end
% Note that in the above loop runs from k+1 to n, because in the back
%substitution phase we use the terms k+1:n
if nargout == 2; det = prod(diag(A)); end
for k = n:-1:1 % Back substitution phase
    b(k) = (b(k) - A(k,k+1:n)*b(k+1:n))/A(k,k);
end
x = b;
end

%Gauss Jordan Form
function x = gaussPiv(A,b)
% Solves A*x = b by Gauss elimination with row pivoting.
% USAGE: x = gaussPiv(A,b)
if size(b,2)> 1; b = b'; end
n = length(b); s = zeros(n,1);
%----------Set up scale factor array----------
for i = 1:n; s(i) = max(abs(A(i,1:n))); end
%---------Exchange rows if necessary----------
for k = 1:n-1
    [Amax, p] = max(abs(A(k:n,k))./s(k:n));
    p = p + k - 1;
    if Amax < eps; error('Matrix is singular'); end
    if p~=k
        b = swapRow(b,k,p);
        s = swapRow(s,k,p);
        A = swapRow(A,k,p);
    end
    %--------------Elimination pass---------------
    for i = k+1:n
        if A(i,k)~= 0
            lambda = A(i,k)/A(k,k);
            A(i,k+1:n) = A(i,k+1:n) - lambda*A(k,k+1:n);
            b(i) = b(i) - lambda*b(k);
        end
    end
end
%------------Back substitution phase----------
for k = n:-1:1
    b(k) = (b(k) - A(k,k+1:n)*b(k+1:n))/A(k,k);
end
x = b;
end