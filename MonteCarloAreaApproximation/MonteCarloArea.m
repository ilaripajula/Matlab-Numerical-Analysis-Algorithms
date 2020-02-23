clear;clc;
close all
%increase plot size
%figure('Renderer', 'painters', 'Position', [10 10 900 600])

intervals  = 5:5:50;
try_count = [50,100,500,1000];
times = zeros(1,length(try_count));

for a = 1:1:length(try_count)
    [count(a,:),times(a,:)] = calculateP(try_count(a));
    ratios(a,:) = count(a,:)/try_count(a);
end

trueratios = (pi*(5:5:50).^2)/(100^2);

h = figure(2);set(h,'Position',[10 10 600 600])
hold on
plot(intervals,ratios,'-',(0:5:50),trueratios,'-')
legend('50 trys','100 trys','500 trys','1000 trys','True Ratios (intervals of 5)')
hold off

figure(3); plot(try_count,times,'-');legend('Number of Random Numbers Created vs. time elapsed');

function h = circle(x,y,r)
p = figure(1);set(p,'Position',[15 10 600 600])
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit);
hold off
end

function [count,t] = calculateP(try_count)
count = zeros(1,10);
intervals = 5:5:50;
comp_time = zeros(1,100);

tic
x = -50+100*rand(try_count,1);
y = -50+100*rand(try_count,1);
t = toc;

hold on
plot(x,y,'*')
hold off

for r = intervals
    circle(0,0,r);
end
for a = 1:1:try_count
    i = 10;
    xp = x(a);
    yp = y(a);
    for r = intervals
        if (xp^2 + yp^2) < r^2
        count(i) = count(i) + 1;
        i = i - 1;
        end
    end
end
end