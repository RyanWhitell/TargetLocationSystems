function plot_circle(x,y,r,identifier)
% PLOT_CIRCLE
% This function plots a circle for visualization of the main algorithm
 
ang=0:(2*pi)/1000:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
 
global CIRCLEPLOTA CIRCLEPLOTB CIRCLEPLOTC;
 
if identifier == 'A'
    delete(CIRCLEPLOTA);
    CIRCLEPLOTA = plot(x+xp,y+yp,'m');
elseif identifier == 'B';
    delete(CIRCLEPLOTB);
    CIRCLEPLOTB = plot(x+xp,y+yp,'b');
elseif identifier == 'C'
    delete(CIRCLEPLOTC);
    CIRCLEPLOTC = plot(x+xp,y+yp,'g');
end
hold on
end